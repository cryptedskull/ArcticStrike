require "openssl"

module Encryption
    def self.encrypt_string(args)
        string = args[0]
        key = args[1]