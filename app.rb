require 'pidof'
require_relative 'metrics.rb'

class RPID
  def initialize
    @pid = Pidof.find('neovide')
    self.readfile @pid
  end

  private
 
  def readfile pid
    line = IO.readlines('pid.txt').last
    call_metrics line
  end

  def call_metrics pid
    new_metrics = Metrics.new pid
  end

end
