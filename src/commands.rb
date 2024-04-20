module ArcticStrike
    module Commands
        def self.help(args)
            puts("Sorry, I can't help you yet!")
        end

        def self.whoami(args)
            puts "You are the user, duh!"
        end

        def self.clear(args)
            print "\e[2J\e[f"
        end

        def self.exec(args)
            system args
        end

        def self.connect(args)
            if args.length < 3
                puts "Usage: connect <target_ip> <target_port> <message>"
                return
            end
            ArcticStrike::Networking::Sockets.tcp_connect(args[0], args[1].to_i, args[2..].join(' '))
        end

        def self.listen(args)
            if args.length < 2
                puts "Usage: server <listen_ip> <listen_port>"
                return
            end
            
            ArcticStrike::Networking::Sockets.tcp_listen(args[0], args[1].to_i)
        end


        def self.exit(args)
            Handler.interrupt()
        end

        def self.banner(banner_file = "resources/banner.txt")
            begin
                banner = File.readlines(banner_file).map(&:chomp)
                terminal_width = `tput cols`.to_i
            
                banner.each do |line|
                padding = (terminal_width - line.length) / 2
                padding.times { print " " }
                puts line
                end
            rescue => e
                puts "[ERROR]> #{e}"
            end
        end
    end
    module Handler
        def self.interrupt
            Commands.clear(args)
            puts "[!] Now exiting ArcticStrike, goodbye!"
            exit
        end
    end
end