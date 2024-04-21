module ArcticStrike::Networking
  class Host
    attr_accessor :hostname, :ip_address, :control_port, :status, :operating_system

    def self.initialize(hostname, ip_address)
      @hostname = hostname
      @ip_address = ip_address
      @status = :disconnected
    end

    def self.connect(ip_address, control_port, payload)
      ArcticStrike::Networking::Sockets.tcp_connect(ip_address, control_port, payload)
      @status = :connected
    end
  end
end