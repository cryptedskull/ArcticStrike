require 'readline'
require 'rainbow'

module ArcticStrike
  module UserInterface
    PROGRAM_NAME = 'ArcticStrike'
    ACTIVE_AREA = 'Dash'

    def self.setup_autocomplete
      Readline.completion_proc = proc { |input| ArcticStrike::Commands.autocomplete(input) }
    end

    def self.user_prompt
      setup_autocomplete
      print "\e[?12h"
      while buf = Readline.readline("#{Rainbow("╭─[[").blue} #{PROGRAM_NAME} #{Rainbow("]]─[").blue}#{Time.new.strftime('%X')}#{Rainbow("]\n╰─[>").blue} #{ACTIVE_AREA} #{Rainbow("<] :: ").blue}", true)
        ArcticStrike::Commands.execute(buf)
      end
    end
  end
end
