# This class was generated on Thu, 15 Jun 2017 16:02:42 PDT by version 0.01 of Braintree SDK Generator
# webhooks_delete_request.rb
# DO NOT EDIT
# @type request
# @json {"Name":"webhooks.delete","Description":"Deletes a webhook, by ID.","Parameters":[{"Type":"string","VariableName":"webhook_id","Description":"The ID of the webhook to delete.","IsArray":false,"ReadOnly":false,"Visible":false,"Required":true,"Properties":null,"Location":"path"}],"RequestType":null,"ResponseType":null,"ContentType":"application/json","HttpMethod":"DELETE","Path":"/v1/notifications/webhooks/{webhook_id}","Visible":true,"ExpectedStatusCode":200}

require 'net/http'

=begin
Deletes a webhook, by ID.
=end

module PayPalRequest

  class WebhooksDeleteRequest < Net::HTTPGenericRequest

    def initialize()
      initheader = {"Content-Type" => "application/json"}
      super "DELETE", true, true, "/v1/notifications/webhooks/{webhook_id}?", initheader
    end

    def webhookId(webhookId)
        @path = @path.gsub("{webhook_id}", webhookId)
    end

    

  end

end