module ArcticStrike
  module UI
    @PROGRAM_NAME = 'ArcticStrike'
    @ACTIVE_AREA = 'Dash'
    def self.user_prompt
      print "\e[?12h"
      while buf = Readline.readline("╭─[[ #{@PROGRAM_NAME} ]]─[#{Time.new.strftime('%X')}]\n╰─[ #{@ACTIVE_AREA} ] : ", true)
        ArcticStrike::Commands::Parser.input(buf)
      end
    end
  end
end