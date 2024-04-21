require 'optparse'
module ArcticStrike
  # Control options
  module Options
    @options = {}
    def self.program_start
      OptionParser.new do |opts|
        opts.banner = 'Usage: arctic [options]'
        opts.on('-v', '--verbose', 'Show extra information') do
          @options[:verbose] = true
        end
        opts.on('-d', '--daemon', 'Run in the background') do
          @options[:daemon] = true
        end
      end.parse!
    end
  end
end