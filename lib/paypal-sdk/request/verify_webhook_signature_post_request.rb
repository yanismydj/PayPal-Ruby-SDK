# This class was generated on Fri, 16 Jun 2017 10:45:02 PDT by version 0.01 of Braintree SDK Generator
# verify_webhook_signature_post_request.rb
# DO NOT EDIT
# @type request
# @json {"Name":"verify.webhook.signature.post","Description":"Verifies a webhook signature.","Parameters":[],"RequestType":{"Type":"Verify Webhook Signature","VariableName":"body","Description":"Verify the webhook signature.","IsArray":false,"ReadOnly":false,"Visible":false,"Required":false,"Properties":null},"ResponseType":{"Type":"Verify Webhook Signature Response","VariableName":"","Description":"The verify webhook signature response.","IsArray":false,"ReadOnly":false,"Visible":false,"Required":false,"Properties":null},"ContentType":"application/json","HttpMethod":"POST","Path":"/v1/notifications/verify-webhook-signature","Visible":true,"ExpectedStatusCode":200}

require 'net/http'

=begin
Verifies a webhook signature.
=end

module PayPalRequest

  class VerifyWebhookSignaturePostRequest < Net::HTTPGenericRequest

    def initialize()
      initheader = {"Content-Type" => "application/json"}
      super "POST", true, true, "/v1/notifications/verify-webhook-signature?", initheader
    end

    
    
    def data(body)
        @body = body
    end

  end

end