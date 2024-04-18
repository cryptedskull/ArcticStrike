require "socket"

module Networking
    def self.tcp_connect(target_ip, target_port, message)
        begin
            client = TCPSocket.new(target_ip, target_port)
            send = client.puts message
            response = client.gets
            puts response
            client.close
        rescue => e
            puts "[ERROR] #{e}"
        end
    end


    def self.tcp_listen(listen_ip, listen_port, interrupt = "false")
        begin
            server = TCPServer.new(listen_ip, listen_port)
            loop do
                client = server.accept
                client_message = client.gets
                puts client_message
                client.puts "Hey, it's the server. What's up?"
                client.close
                if interrupt.downcase != "false"
                    break
                end
            end
            server.close
        rescue => e
            puts "[ERROR] #{e}"
        end
    end



end