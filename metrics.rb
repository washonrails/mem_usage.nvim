require 'rubygems'
require 'get_process_mem'

class Metrics
  def initialize pid
    @pid = pid
    puts "Nvim metrics #{@pid}"
  end
end
