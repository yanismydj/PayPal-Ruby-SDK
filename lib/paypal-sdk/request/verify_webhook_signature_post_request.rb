# This class was generated on Fri, 16 Jun 2017 12:36:22 PDT by version 0.01 of Braintree SDK Generator
# verify_webhook_signature_post_request.rb
# DO NOT EDIT
# @type request
# @json {"Name":"verify.webhook.signature.post","Description":"Verifies a webhook signature.","Parameters":[],"RequestType":{"Type":"Verify Webhook Signature","VariableName":"body","Description":"Verify the webhook signature.","IsArray":false,"ReadOnly":false,"Visible":false,"Required":false,"Properties":null},"ResponseType":{"Type":"Verify Webhook Signature Response","VariableName":"","Description":"The verify webhook signature response.","IsArray":false,"ReadOnly":false,"Visible":false,"Required":false,"Properties":null},"ContentType":"application/json","HttpMethod":"POST","Path":"/v1/notifications/verify-webhook-signature","Visible":true,"ExpectedStatusCode":200}


=begin
Verifies a webhook signature.
=end

module PayPalRequest

  class VerifyWebhookSignaturePostRequest

    attr_accessor :path, :body, :headers, :verb

    def initialize()
        @headers = {"Content-Type" => "application/json"}
        @verb = "POST"
        @path = "/v1/notifications/verify-webhook-signature?"
    end
    
    def requestBody(body)
        @body = body
    end
  end

end