require 'rainbow'

module ArcticStrike
  module UserInterface
    def self.put_success(args)
      puts "#{Rainbow('[+ GOOD +] >').green} #{args}"
    end

    def self.put_info(args)
      puts "#{Rainbow('[? INFO ?] >').blue} #{args}"
    end

    def self.put_warn(args)
      puts "#{Rainbow('[! WARN !] >').yellow} #{args}"
    end

    def self.put_error(args)
      puts "#{Rainbow('[X ERR! X] >').red} #{args}"
    end
  end
end

# ArcticStrike::UserInterface.put_success("Hello world")
# ArcticStrike::UserInterface.put_info("Hello world")
# ArcticStrike::UserInterface.put_warn("Hello world")
# ArcticStrike::UserInterface.put_error("Hello world")
