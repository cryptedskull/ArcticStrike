#!/usr/bin/env ruby

require 'optparse'
require 'ipaddr'
require 'readline'

load "network/tcp_connections.rb"

@PROGRAM_NAME = "ArcticStrike"
@options = {}

def clear_screen
    print "\e[2J\e[f"
  end

def interrupt_handler
    clear_screen()
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
    split_command = buf.scan(/(".*"|[\w\:\:\.\-\\]+)/).flatten

    command = split_command.first
    command_args = split_command.drop(1)

    if command == "whoami"
        puts "[>] You are the user, duh!"
    elsif command == "help"
        puts "Can't help right now, I'm not developed yet"
    elsif command == "exit" || split_command.first == "quit"
        clear_screen()
        puts "[!] Now exiting ArcticStrike, goodbye!"
        exit
    elsif command == "client"
        tcp_connect("127.0.0.1", 8080, command_args)
    elsif command == "server"
        tcp_listen("0.0.0.0", 8080)
    elsif command == "clear"
        clear_screen()
    else
        puts "[>] #{split_command.first}"
    end

    return
end

display_banner("../resources/banner.txt")


while buf = Readline.readline("<<#{@PROGRAM_NAME}>> :: ", true)
    command_parse(buf)
end