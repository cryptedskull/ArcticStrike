require "socket"
module ArcticStrike
module Networking
    module Sockets
        def self.tcp_connect(target_ip, target_port, message)
            begin
                client = TCPSocket.new(target_ip, target_port)
                send = client.puts message
                response = client.gets
                puts response
                client.close
            rescue => e
                puts "[ERROR]> #{e}"
            ensure
                client.close
            end
        end


        def self.tcp_listen(listen_ip, listen_port, interrupt = "false")
            trap("INT") do
                puts "\n"
                break
            end

            begin
                server = TCPServer.new(listen_ip, listen_port)
                puts ">>> Now listening for connections on #{listen_ip}:#{listen_port} <<<"
                loop do
                    client = server.accept
                    client_message = client.gets
                    puts "Recieved <<< #{client_message}"
                    client.puts Time.new.strftime("%X")
                    client.close
                end
            rescue => e
                if e !="break from proc-closure"
                    puts "[ERROR]> #{e}"
                end
            ensure
                if server
                    server.close
                end
            end
        end
    end
end
end