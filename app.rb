require_relative 'metrics.rb'
require 'pidof'

class RPID
  def initialize
    @pid = Pidof.find('neovide')
    readfile @pid
  end

  private
 
  def readfile pid
    file = File.open('pid.txt')

    file.each { |line | puts line}
  end

  def call_metrics pid
    new_metrics = Metrics.new pid
  end
end
