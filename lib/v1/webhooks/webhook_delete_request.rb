# This class was generated on Thu, 01 Feb 2018 12:45:02 PST by version 0.1.0-dev+3a517e of Braintree SDK Generator
# webhook_delete_request.rb
# @version 0.1.0-dev+3a517e
# @type request
# @data H4sIAAAAAAAC/2SQzU7jMBSF9/MU1llbTWc0K+9QE9SKvwIVG1Qht74lhtQ29g0QVX13ZBIELdtPx77fOTtc6i1B4Y1WtffPI0MNMUGipLSONrD1DgrlJ05CiyEoxaoTs3IEieuWYjfXUW+JKSao+6XElLSheExPfdwes7nm+oDtsOhCdkocrXuExJ2OVq8aOnR9sAYSZ9QN+Jf0oiYxK4XfCK7pS1ywF33J7H4So+76c2OJG9LmyjUd1EY3iTJ4aW0kA8WxJYl59IEiW0pQrm2a/bLPUOL+kwwzSsG7RD/ZxDsmN8SgQ2jsWmfR4il5B4kpc7ggrr3Je1fn1aJCvw4Uite/hfNsN8OjVAx1UrH7nmMPieo90JrJ3LLmNk28Iah/4//7Px8AAAD//w==
# DO NOT EDIT
require 'cgi'

module PayPal
  module V1
    module Webhooks

      #
      # Deletes a webhook, by ID.
      #
      class WebhookDeleteRequest
        attr_accessor :path, :body, :headers, :verb

        def initialize(webhook_id)
          @headers = {}
          @body = nil
          @verb = "DELETE"
          @path = "/v1/notifications/webhooks/{webhook_id}?"

          @path = @path.gsub("{webhook_id}", CGI::escape(webhook_id.to_s))
          @headers["Content-Type"] = "application/json"
        end
      end
    end
  end
end
