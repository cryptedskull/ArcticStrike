require "socket"

def tcp_connect(target_ip, target_port, message)
    client = TCPSocket.new(target_ip, target_port)
    send = client.puts message
    response = client.gets
    puts response
    client.close
end


def tcp_listen(listen_ip, listen_port, interrupt = "false")
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
end