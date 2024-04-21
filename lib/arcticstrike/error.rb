module ArcticStrike
  module Error
    def self.quit
      ArcticStrike::Commands.execute('clear')
      puts '[!] Now exiting ArcticStrike, goodbye!'
      exit
    end

    def self.put_error(args)
      puts "[! Error !] > #{args}"
    end
  end
end