module ArcticStrike
module CommandParser
    def self.input(buf)
        args = buf.strip.split(/\s+/)
        command = args.shift
        case command
        when "whoami"
            Commands.whoami(args)
        when "help"
            Commands.help(args)
        when "exit" || "quit"
            Commands.exit()
        when "connect"
            Commands.connect(args)
        when "listen"
            Commands.listen(args)
        when "clear"
            Commands.clear()
        when "banner"
            Commands.banner(args)
        when "easter-egg"
            puts "Hi :)"
        else
            puts "Invalid command: #{command}"
        end
        return
    end
end
end