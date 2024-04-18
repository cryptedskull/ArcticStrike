require "socket"

def tcp_connect(target_ip, target_port, message)
    client = TCPSocket.new(target_ip, target_port)
    send = client.puts message
    response = client.gets
    puts response
    client.close
end


def tcp_listen(listen_ip, listen_port)
    server = TCPServer.new(listen_port)
    #loop do #REMOVE LOOP, ONLY ACCEPT ONCE
        client = server.accept
        client_message = client.gets
        puts client_message
        client.puts "Hey it's the server, zup?"
        client.close
    server.close()
    #end
end