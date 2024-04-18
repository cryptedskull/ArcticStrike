module Commands
    def self.whoami(args)
        puts "You are the user, duh!"
    end

    def self.clear()
        print "\e[2J\e[f"
    end

    def self.connect(args)
        if args.length < 3
            puts "Usage: connect <target_ip> <target_port> <message>"
            return
          end
        Networking.tcp_connect(args[0], args[1].to_i, args[2..].join(' '))
    end

    def self.listen(args)
        if args.length < 2
            puts "Usage: server <listen_ip> <listen_port> [interrupt (true/false)]"
            return
        end
        
        Networking.tcp_listen(args[0], args[1].to_i, args[2].to_s)
    end


    def self.exit()
        Handler.interrupt()
    end

    def self.banner(banner_file)
        banner = File.readlines(banner_file).map(&:chomp)
        terminal_width = `tput cols`.to_i
      
        banner.each do |line|
          padding = (terminal_width - line.length) / 2
          padding.times { print " " }
          puts line
        end
      end

end


module Handler
    def self.interrupt
        Commands.clear()
        puts "[!] Now exiting ArcticStrike, goodbye!"
        exit
    end
end