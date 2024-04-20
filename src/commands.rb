module ArcticStrike
  # Commands
  class Commands
    COMMANDS = {
      help: ->(args = nil) { args ? (puts "Can't help you yet, sorry!") : (puts "Sorry, I can't help you yet!") },
      whoami: ->(_args) { puts 'You are the user, duh!' },
      clear: ->(_args = nil) { print "\e[2J\e[f" },
      exec: ->(args) { system args },
      connect: ->(args) { args.length < 2 ? (puts 'Usage: connect <target_ip> <target_port>') : (ArcticStrike::Networking::Sockets.tcp_connect(args[0], args[1].to_i)) },
      listen: ->(args) { args.length < 2 ? (puts 'Usage: server <listen_ip> <listen_port>') : (ArcticStrike::Networking::Sockets.tcp_listen(args[0], args[1].to_i)) },
      exit: ->(_args) { ArcticStrike::Error.quit },
      banner: ->(_args) {
        banner_file = 'resources/banner.txt'
        terminal_width = [`tput cols`.to_i, 100].min
        banner = File.readlines(banner_file).map(&:chomp)
        banner.each { |line| padding = (terminal_width - line.length) / 2; padding.times { print ' ' }; puts line }
      }
    }.freeze

    def self.autocomplete(input)
      COMMANDS.keys.grep(/^#{Regexp.escape(input)}/)
    end

    def self.execute(input)
      command, *args = input.strip.split(/\s+/)
      command = command.to_sym
      return unless COMMANDS.key?(command)

      COMMANDS[command].call(args)
    end
  end
end