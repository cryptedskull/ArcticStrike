module ArcticStrike
  # Handles the parsing of commands
  module Parser
    # Parses the input buffer, executes the corresponding command
    def self.input(buf)
      command_name, *args = buf.strip.split(/\s+/)
      if command_name.nil? || command_name.empty?
        puts "Invalid command: #{buf}"
        return
      end

      command_name = command_name.to_sym
      command = COMMANDS[command_name]

      if command
        command.call(args)
      elsif %i[exit quit].include?(command_name)
        Commands.execute(command_name.to_s) # Trigger exit or quit command
      else
        puts "Invalid command: #{command_name}"
      end
    end
  end
end