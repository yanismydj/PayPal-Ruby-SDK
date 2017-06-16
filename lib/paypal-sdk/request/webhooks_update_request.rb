# This class was generated on Fri, 16 Jun 2017 12:36:22 PDT by version 0.01 of Braintree SDK Generator
# webhooks_update_request.rb
# DO NOT EDIT
# @type request
# @json {"Name":"webhooks.update","Description":"Replaces webhook fields with new values. Pass a `json_patch` object with `replace` operation and `path`, which is `/url` for a URL or `/event_types` for events. The `value` is either the URL or a list of events.","Parameters":[{"Type":"string","VariableName":"webhook_id","Description":"The ID of the webhook to update.","IsArray":false,"ReadOnly":false,"Visible":false,"Required":true,"Properties":null,"Location":"path"}],"RequestType":{"Type":"JSON Patch","VariableName":"body","Description":"A JSON patch request.","IsArray":true,"ReadOnly":false,"Visible":false,"Required":false,"Properties":null},"ResponseType":{"Type":"Webhook","VariableName":"","Description":"One or more webhook objects.","IsArray":false,"ReadOnly":false,"Visible":false,"Required":false,"Properties":null},"ContentType":"application/json","HttpMethod":"PATCH","Path":"/v1/notifications/webhooks/{webhook_id}","Visible":true,"ExpectedStatusCode":200}


=begin
Replaces webhook fields with new values. Pass a `json_patch` object with `replace` operation and `path`, which is `/url` for a URL or `/event_types` for events. The `value` is either the URL or a list of events.
=end

module PayPalRequest

  class WebhooksUpdateRequest

    attr_accessor :path, :body, :headers, :verb

    def initialize()
        @headers = {"Content-Type" => "application/json"}
        @verb = "PATCH"
        @path = "/v1/notifications/webhooks/{webhook_id}?"
    end

    def webhookId(webhookId)
        @path = @path.gsub("{webhook_id}", webhookId)
    end
    
    def requestBody(body)
        @body = body
    end
  end

end