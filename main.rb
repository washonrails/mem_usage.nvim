require_relative 'app.rb'

module Socket
  class Process
    
    def self.write_f
      spawn "pgrep neovide >> pid.txt"

      sleep 1
      self.rfile
    end

    private

    def self.rfile
      read_file = RPID.new
    end

  end
end

socket = Socket::Process
socket.write_f
