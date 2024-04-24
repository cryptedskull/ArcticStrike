module ArcticStrike
  # Command and control
  module C2
    def self.start_server
      puts 'Hi'
    end

    def self.check_agent
      puts 'Checking host...'
    end

    def self.process_info
      puts 'Checking received info'
    end

    def self.reverse_eng_check
      puts 'Checking if agent compromised...'
    end

    def self.verify_agent
      puts 'Verifying host identity'
    end

    def self.deauthorize_agent
      puts 'Removing host from agents'
    end
  end
end