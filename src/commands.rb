module Commands
    def self.whoami(args)
        puts "You are the user, duh!"
    end

    def self.clear()
        print "\e[2J\e[f"
    end

    def self.client(args)
        if args.length < 3
            puts "Usage: connect <target_ip> <target_port> <message>"
            return
          end
        tcp_connect(args[0], args[1].to_i, args[2..].join(' '))
    end

    def self.server(args)
        if args.length < 2
            puts "Usage: server <listen_ip> <listen_port> [interrupt (true/false)]"
            return
        end
        tcp_listen(args[0], args[1].to_i, args[2].to_s)
    end

end