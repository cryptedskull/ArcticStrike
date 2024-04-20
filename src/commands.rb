module ArcticStrike
  # Commands
  module Commands
    def self.help(args = nil)
      help_query = args
      if !args
        puts("Sorry, I can't help you with \"#{help_query.join(' ')}\" yet!")
      else
        puts("Can't help you yet, sorry!")
      end
    end

    def self.whoami(_args)
      puts 'You are the user, duh!'
    end

    def self.clear(_args = nil)
      print "\e[2J\e[f"
    end

    def self.exec(args)
      system args
    end

    def self.connect(args)
      if args.length < 3
        puts 'Usage: connect <target_ip> <target_port> <message>'
        return
      end
      ArcticStrike::Networking::Sockets.tcp_connect(args[0], args[1].to_i, args[2..].join(' '))
    end

    def self.listen(args)
      if args.length < 2
        puts 'Usage: server <listen_ip> <listen_port>'
        return
      end

      ArcticStrike::Networking::Sockets.tcp_listen(args[0], args[1].to_i)
    end

    def self.exit(_args)
      Handler.interrupt
    end

    def self.banner(_args)
      banner_file = 'resources/banner.txt'
      if `tput cols`.to_i > 100
        terminal_width = 100
      elsif `tput cols`.to_i <= 65
        banner_file = 'resources/small_banner.txt'
        terminal_width = `tput cols`.to_i
      else
        terminal_width = `tput cols`.to_i
      end

      banner = File.readlines(banner_file).map(&:chomp)
      banner.each do |line|
        padding = (terminal_width - line.length) / 2
        padding.times { print ' ' }
        puts line
      end
    end

    #def self.exploit(args)
    #  ArcticStrike::Networking::Host.connect(args)
    #end
  end
end
