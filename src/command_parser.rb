module ArcticStrike
module CommandParser
    def self.input(buf)
        args = buf.strip.split(/\s+/)
        command = args.shift
        command_method = Commands.method(command) if Commands.respond_to?(command)

        if command_method
          command_method.call(args)
        elsif command == "exit" || command == "quit"
          Commands.exit()
        else
            puts "Invalid command: #{command}"
        end
        return
    end
end
end