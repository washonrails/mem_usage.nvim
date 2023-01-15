require_relative 'metrics.rb'
require 'get_process_mem'
require 'sys/cpu'

include Sys

module Metrics
  class Memory
    attr_reader :pid

    def initialize pid
      @pid = pid
      memory_metrics
    end

    private

    def memory_metrics

      pid = Process.spawn "process-metrics --pid #{@pid}"
      Process.wait pid

      print "Do you want to visualize the process in real time? (y/n) "
      res = gets.chomp.to_s

      Graphics.new @pid if res.eql? 'y'
    end

end


  class Graphics

    def initialize ppid
      @pid = ppid
      mem_graph {Process.spawn "htop --pid #{@pid}"}
      # proc_graph { CPU.processors { |cpu| p cpu.cpu_mhz } }
    end

    private

    def mem_graph
      return yield if block_given?
    end

    # def proc_graph
    #   yield if block_given?
    # end

  end
end
