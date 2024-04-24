require 'socket'
module ArcticStrike
  module Networking
    # Network sockets
    module Sockets
      def self.tcp_connect(target_ip, target_port)
        client = TCPSocket.new(target_ip, target_port)
        puts "[i] #{client.peeraddr[3]}:#{client.peeraddr[1]} CONNECTED!"
        message = Readline.readline("Message >>> ")
        send = client.puts message
        response = client.gets
        puts "[#{target_ip}:#{target_port}] >>> #{response}"
        client.close
      rescue LocalJumpError
        puts 'Quitting listner...'
      rescue StandardError => e
        ArcticStrike::UserInterface.put_error(e)
      end

      def self.tcp_listen(listen_ip, listen_port)
        server = TCPServer.new(listen_ip, listen_port)
        puts ">>> Now listening for connections on #{listen_ip}:#{listen_port} <<<"
        loop do
          client = server.accept
          puts "[i] #{client.peeraddr[3]}:#{client.peeraddr[1]} CONNECTED!"
          client_message = client.gets
          puts "#{client.peeraddr[3]}:#{client.peeraddr[1]} >>> #{client_message}"
          client.puts 'Message received!'
        end
      rescue LocalJumpError
        puts 'Quitting listner...'
      rescue StandardError => e
        ArcticStrike::UserInterface.put_error(e)
      ensure
        server&.close
      end
    end
  end
end
