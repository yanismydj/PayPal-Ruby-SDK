# This class was generated on Thu, 01 Feb 2018 12:45:00 PST by version 0.1.0-dev+3a517e of Braintree SDK Generator
# credit_card_delete_request.rb
# @version 0.1.0-dev+3a517e
# @type request
# @data H4sIAAAAAAAC/2yRzW4aMRDH730Ka84uS3v0rWK3AvWLtiiXCKFhPWQdGdsZz6KsEO8emeUAJNefZzz/jyP8xj2BgZbJOvncItuJJU9CoKGm3LJL4mIAA/UZZ4XqgL0XsmpcUmVJq+2gFvUENPztiYclMu5JiDOYx7WGOaElvqffI+/v2RKlu2FHWA2paMzCLjyBhgdkh1tPN9o3RcbGWdDwg4bL0zsTq47UolZxp6Sjj4woiWoMoHj5xozDeH6q4R+h/RP8AGaHPlMBL71jsmCEe9Kw5JiIxVEGE3rvT+txhrKMnxRYUE4xZLpmsxiEwmUMMCXvWiyiq+ccA2iYi6RfJF20pYvmZ7NqYEwLDFSHL9XZTHVVZK6Ot9GcQEPzmqgVsv8Fpc+zaAnM1+n09OkNAAD//w==
# DO NOT EDIT
require 'cgi'

module PayPal
  module V1
    module Vault

      #
      # Deletes a vaulted credit card, by ID.
      #
      class CreditCardDeleteRequest
        attr_accessor :path, :body, :headers, :verb

        def initialize(credit_card_id)
          @headers = {}
          @body = nil
          @verb = "DELETE"
          @path = "/v1/vault/credit-cards/{credit_card_id}?"

          @path = @path.gsub("{credit_card_id}", CGI::escape(credit_card_id.to_s))
          @headers["Content-Type"] = "application/json"
        end
      end
    end
  end
end
