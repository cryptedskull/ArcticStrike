#!/usr/bin/env ruby

require 'optparse'
require 'ipaddr'
require 'readline'

require_relative "network/tcp_connections"
require_relative "commands"

@PROGRAM_NAME = "ArcticStrike"
@options = {}

def interrupt_handler
    Commands.clear()
    puts "[!] Now exiting ArcticStrike, goodbye!"
    exit
end

trap("INT") {interrupt_handler}

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



def display_banner(banner_file)
  banner = File.readlines(banner_file).map(&:chomp)
  terminal_width = `tput cols`.to_i

  banner.each do |line|
    padding = (terminal_width - line.length) / 2
    padding.times { print " " }
    puts line
  end
end

  
def command_parse(buf)
    args = buf.strip.split(/\s+/)
    command = args.shift
    case command
    when "whoami"
        Commands.whoami(args)
    when "help"
        Commands.help(args)
    when "exit" || "quit"
        Commands.exit(args)
    when "client"
        Commands.connect(args)
    when "server"
        Commands.listen(args)
    when "clear"
        Commands.clear(args)
    else
        puts "Invalid command: #{command}"
    end

    return
end

display_banner("../resources/banner.txt")

while buf = Readline.readline("<<#{@PROGRAM_NAME}>> :: ", true)
    command_parse(buf)
end