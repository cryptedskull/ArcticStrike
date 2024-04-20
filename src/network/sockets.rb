require 'socket'
module ArcticStrike
  module Networking
    module Sockets
      def self.tcp_connect(target_ip, target_port, message)
        client = TCPSocket.new(target_ip, target_port)
        send = client.puts message
        response = client.gets
        puts response
        client.close
      rescue StandardError => e
        puts "[ERROR]> #{e}"
      ensure
        client.close
      end

      def self.tcp_listen(listen_ip, listen_port, interrupt = 'false')
        trap('INT') do
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
            client.puts Time.new.strftime('%X')
            client.close
          end
        rescue StandardError => e
          puts "[ERROR]> #{e}" if e != 'break from proc-closure'
        ensure
          server.close if server
        end
      end
    end
  end
end
