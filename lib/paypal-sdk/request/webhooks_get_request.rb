# This class was generated on Fri, 16 Jun 2017 12:36:22 PDT by version 0.01 of Braintree SDK Generator
# webhooks_get_request.rb
# DO NOT EDIT
# @type request
# @json {"Name":"webhooks.get","Description":"Shows details for a webhook, by ID.","Parameters":[{"Type":"string","VariableName":"webhook_id","Description":"The ID of the webhook for which to show details.","IsArray":false,"ReadOnly":false,"Visible":false,"Required":true,"Properties":null,"Location":"path"}],"RequestType":null,"ResponseType":{"Type":"Webhook","VariableName":"","Description":"One or more webhook objects.","IsArray":false,"ReadOnly":false,"Visible":false,"Required":false,"Properties":null},"ContentType":"application/json","HttpMethod":"GET","Path":"/v1/notifications/webhooks/{webhook_id}","Visible":true,"ExpectedStatusCode":200}


=begin
Shows details for a webhook, by ID.
=end

module PayPalRequest

  class WebhooksGetRequest

    attr_accessor :path, :body, :headers, :verb

    def initialize()
        @headers = {"Content-Type" => "application/json"}
        @verb = "GET"
        @path = "/v1/notifications/webhooks/{webhook_id}?"
    end

    def webhookId(webhookId)
        @path = @path.gsub("{webhook_id}", webhookId)
    end
  end

end