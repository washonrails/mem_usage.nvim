require 'pidof'
require_relative 'metrics.rb'

class GPID
  def self.get_pid
    @pid = Pidof.find('neovide')
    self.call_metrics @pid
  end

  private
 
  def self.call_metrics pid
    new_metrics = Metrics::Memory.new pid
  end

end
