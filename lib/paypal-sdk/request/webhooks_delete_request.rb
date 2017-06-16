# This class was generated on Fri, 16 Jun 2017 12:36:22 PDT by version 0.01 of Braintree SDK Generator
# webhooks_delete_request.rb
# DO NOT EDIT
# @type request
# @json {"Name":"webhooks.delete","Description":"Deletes a webhook, by ID.","Parameters":[{"Type":"string","VariableName":"webhook_id","Description":"The ID of the webhook to delete.","IsArray":false,"ReadOnly":false,"Visible":false,"Required":true,"Properties":null,"Location":"path"}],"RequestType":null,"ResponseType":null,"ContentType":"application/json","HttpMethod":"DELETE","Path":"/v1/notifications/webhooks/{webhook_id}","Visible":true,"ExpectedStatusCode":200}


=begin
Deletes a webhook, by ID.
=end

module PayPalRequest

  class WebhooksDeleteRequest

    attr_accessor :path, :body, :headers, :verb

    def initialize()
        @headers = {"Content-Type" => "application/json"}
        @verb = "DELETE"
        @path = "/v1/notifications/webhooks/{webhook_id}?"
    end

    def webhookId(webhookId)
        @path = @path.gsub("{webhook_id}", webhookId)
    end
  end

end