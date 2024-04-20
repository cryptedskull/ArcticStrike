require 'socket'
module ArcticStrike
  module Networking
    # Network sockets
    module Sockets
      trap('INT') do
        puts "\n"
        break
      end

      def self.tcp_connect(target_ip, target_port)
        client = TCPSocket.new(target_ip, target_port)
        loop do
          message = Readline.readline("[#{target_ip}:#{target_port}] <<< ")
          send = client.puts message
          response = client.gets
          puts response
          client.close
        end
      rescue StandardError => e
        ArcticStrike::Error.put_error(e)
      ensure
        client&.close
      end

      def self.tcp_listen(listen_ip, listen_port)
        server = TCPServer.new(listen_ip, listen_port)
        puts ">>> Now listening for connections on #{listen_ip}:#{listen_port} <<<"
        loop do
          client = server.accept
          client_message = client.gets
          puts "[#{client.peeraddr[3]}:#{client.peeraddr[1]}] >>> #{client_message}"
          client.puts Readline.readline("[#{client.peeraddr[3]}:#{client.peeraddr[1]}] <<< ")
        end
        client.close
      rescue LocalJumpError
        puts 'Quitting listner...'
      rescue StandardError => e
        ArcticStrike::Error.put_error(e)
      ensure
        server&.close
      end
    end
  end
end
