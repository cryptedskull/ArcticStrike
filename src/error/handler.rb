module ArcticStrike
  module Error
    def self.quit
      ArcticStrike::Commands.clear
      puts '[!] Now exiting ArcticStrike, goodbye!'
      exit
    end

    def self.error_out(args)
      puts "[! Error !] > #{args}"
    end
  end
end