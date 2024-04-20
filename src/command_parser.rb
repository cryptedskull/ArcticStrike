module ArcticStrike
  module Commands
    module Parser #Handles the parsing of commands
      def self.input(buf)
        args = buf.strip.split(/\s+/)
        command = args.shift
        command_method = Commands.method(command) if Commands.respond_to?(command)
        if command_method
          command_method.call(args)
        elsif %w[exit quit].include?(command)
          Commands.exit
        else
          puts "Invalid command: #{command}"
        end
        nil
      end
    end
  end
end