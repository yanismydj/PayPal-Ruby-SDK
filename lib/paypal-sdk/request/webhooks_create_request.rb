# This class was generated on Thu, 15 Jun 2017 16:02:42 PDT by version 0.01 of Braintree SDK Generator
# webhooks_create_request.rb
# DO NOT EDIT
# @type request
# @json {"Name":"webhooks.create","Description":"Subscribes your webhook listener to events. A successful call returns a [`webhook`](/docs/api/webhooks/#definition-webhook:v1) object, which includes the webhook ID for later use.","Parameters":[],"RequestType":{"Type":"Webhook","VariableName":"body","Description":"One or more webhook objects.","IsArray":false,"ReadOnly":false,"Visible":false,"Required":false,"Properties":null},"ResponseType":{"Type":"Webhook","VariableName":"","Description":"One or more webhook objects.","IsArray":false,"ReadOnly":false,"Visible":false,"Required":false,"Properties":null},"ContentType":"application/json","HttpMethod":"POST","Path":"/v1/notifications/webhooks","Visible":true,"ExpectedStatusCode":200}

require 'net/http'

=begin
Subscribes your webhook listener to events. A successful call returns a [`webhook`](/docs/api/webhooks/#definition-webhook:v1) object, which includes the webhook ID for later use.
=end

module PayPalRequest

  class WebhooksCreateRequest < Net::HTTPGenericRequest

    def initialize()
      initheader = {"Content-Type" => "application/json"}
      super "POST", true, true, "/v1/notifications/webhooks?", initheader
    end

    
    
    def data(body)
        @body = body
    end

  end

end