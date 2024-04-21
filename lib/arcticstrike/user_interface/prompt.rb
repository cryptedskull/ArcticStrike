require 'readline'

module ArcticStrike
  module UI
    PROGRAM_NAME = 'ArcticStrike'
    ACTIVE_AREA = 'Dash'

    def self.setup_autocomplete
      Readline.completion_proc = proc { |input| ArcticStrike::Commands.autocomplete(input) }
    end

    def self.user_prompt
      setup_autocomplete
      print "\e[?12h"
      while buf = Readline.readline("╭─[[#{PROGRAM_NAME}]]─[#{Time.new.strftime('%X')}]\n╰─[#{ACTIVE_AREA}] : ", true)
        ArcticStrike::Commands.execute(buf)
      end
    end
  end
end
