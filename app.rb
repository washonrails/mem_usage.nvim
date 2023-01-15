require_relative 'main.rb'

module Socket
  class Process
    
    def self.read_f
      read_file = GPID.get_pid
    end

  end
end

socket = Socket::Process.read_f
