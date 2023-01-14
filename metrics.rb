require_relative 'metrics.rb'
require 'rubygems'
require 'get_process_mem'
require 'sys/cpu'
require 'gruff'

include Sys

class Metrics

  def initialize pid
    @pid = pid
    self.memory_metrics @pid
  end

  private

  def memory_metrics pid
    ppid = Process.spawn "process-metrics --pid #{pid}"
    Process.wait ppid
    
    print "Generate an log graphic ? (y/n) "
    res = gets.chomp.to_s

    check_and_judge res
  end
  
  def check_and_judge response
    
    case response
    when 'y'
      p 'Generating your graphs please wait..'
      new_graph = Graphics.new
    when 'n'
      p 'Aborting'
    end

  end

end

class Graphics
  attr_reader :cpu_model

  def initialize
    @cpu_model = CPU.model_name
    proc_graph
  end
    
  private

  def proc_graph
    puts @cpu_model
    CPU.processors{ |cpu| p cpu.cpu_mhz } # Display full information for each processor.

    g = Gruff::Net.new
    g.title = "Hydra Health Graphic"
    g.labels = {
      0 => '5/6',
      1 => '5/15',
      2 => '5/24',
      3 => '5/30',
      4 => '6/4',
      5 => '6/12',
      6 => '6/21',
      7 => '6/28'
    }
    g.line_width = 3
    g.dot_radius = 4
    g.data :Jimmy, [25, 36, 86, 39, 25, 31, 79, 88]
    g.data :Julie, [22, 29, 35, 38, 36, 40, 46, 57]
    g.write("net.png")
  end
end
