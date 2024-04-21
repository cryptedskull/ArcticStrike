require 'async'
require 'async/http/server'
require 'async/http/endpoint'
require 'socket'

module ArcticStrike
  module Networking
    module HTTP
      class << self
        def server(host = '127.0.0.1', port = 8989)
          @server_socket = TCPServer.new(host, port)
          endpoint = Async::HTTP::Endpoint.parse("http://#{host}:#{port}")
          reactor = Async::Reactor.new

          server = Async::HTTP::Server.new(endpoint, reactor, protocol: :ipv4, scheme: :http) do |request, response|
            response.status = 200
            response['Content-Type'] = 'text/plain'
            response.write("Hello, world!\n")
          end

          Async do |task|
            task.async do
              loop do
                socket = @server_socket.accept
                reactor.io.add(socket, read_ready: ->(socket) { server.handle_request(socket) })
              end
            end

            task.async do
              reactor.run
            end

            task.async do
              Signal.trap('INT') do
                reactor.stop
              end

              Signal.trap('TERM') do
                reactor.stop
              end
            end
          end
        end
      end
    end
  end
end