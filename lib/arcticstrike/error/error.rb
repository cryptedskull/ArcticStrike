# frozen_string_literal: true
module ArcticStrike
  # Error handling
  module Error
    def self.quit
      ArcticStrike::Commands.execute('clear')
      puts '[!] Now exiting ArcticStrike, goodbye!'
      exit
    end
  end
end
