require 'optparse'
require 'ipaddr'
require 'socket'
require 'readline'

@PROGRAM_NAME = "ArcticStrike"
@options = {}



OptionParser.new do |opts|
    opts.banner = "Usage: arctic [options]"
    opts.on("-v","--verbose","Show extra information") do
        @options[:verbose] = true
    end
    opts.on("-d","--daemon","Run in the background") do
        @options[:daemon] = true
    end

    opts.on("--server-ip IP_ADDRESS","Server IP address to use") do |server_ip_addr|
        begin
            IPAddr.new(server_ip_addr)
        rescue
            raise OptionParser::InvalidArgument, "Invalid IP Address used"
        end

        @options[:server_ip_address] = server_ip_addr

        puts "You are using the IP address: #{server_ip_addr}"
    end
end.parse!

def command_parse(buf)
    split_command = buf.scan(/(".*"|[\w\:\:\.\-\\]+)/).flatten
    if split_command.first == "whoami"
        puts "[>] You are the user, duh!"
    elsif split_command.first == "help"
        puts "Can't help right now, I'm not developed yet"
    else
        puts "[>] #{split_command.first}"
    end

    return
end


while buf = Readline.readline("<<#{@PROGRAM_NAME}>> :: ", true)
    command_parse(buf)
end