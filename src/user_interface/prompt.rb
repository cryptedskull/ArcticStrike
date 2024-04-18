def user_prompt
    while buf = Readline.readline("╭─[[ #{@PROGRAM_NAME} ]]─[#{Time.new.strftime("%X")}]\n╰─< #{@ACTIVE_AREA} > :: ", true)
        ArcticStrike::CommandParser.input(buf)
    end
end