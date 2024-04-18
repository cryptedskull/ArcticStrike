def user_prompt
    while buf = Readline.readline("╭─[[ #{@PROGRAM_NAME} ]]─[#{Time.new.strftime("%X")}]\n╰─< #{@ACTIVE_AREA} > :: ", true)
        CommandParser.input(buf)
    end
end