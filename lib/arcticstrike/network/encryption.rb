require 'openssl'

module ArcticStrike
  module Networking
    # Network encryption
    module Encryption
      def self.encrypt_string(args)
        string = args[0]
        key = args[1]
      end

      def self.establish_tunnel(args)
        puts 'Unimplemented'
      end
    end
  end
end
