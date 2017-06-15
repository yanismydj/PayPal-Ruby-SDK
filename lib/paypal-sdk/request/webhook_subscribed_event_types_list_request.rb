# This class was generated on Thu, 15 Jun 2017 16:02:42 PDT by version 0.01 of Braintree SDK Generator
# webhook_subscribed_event_types_list_request.rb
# DO NOT EDIT
# @type request
# @json {"Name":"webhook.subscribed-event-types.list","Description":"Lists event subscriptions for a webhook, by ID.","Parameters":[{"Type":"string","VariableName":"webhook_id","Description":"The ID of the webhook for which to list subscriptions.","IsArray":false,"ReadOnly":false,"Visible":false,"Required":true,"Properties":null,"Location":"path"}],"RequestType":null,"ResponseType":{"Type":"EventTypeList","VariableName":"","Description":"List of webhook events.","IsArray":false,"ReadOnly":false,"Visible":false,"Required":false,"Properties":null},"ContentType":"application/json","HttpMethod":"GET","Path":"/v1/notifications/webhooks/{webhook_id}/event-types","Visible":true,"ExpectedStatusCode":200}

require 'net/http'

=begin
Lists event subscriptions for a webhook, by ID.
=end

module PayPalRequest

  class WebhookSubscribedEventTypesListRequest < Net::HTTPGenericRequest

    def initialize()
      initheader = {"Content-Type" => "application/json"}
      super "GET", true, true, "/v1/notifications/webhooks/{webhook_id}/event-types?", initheader
    end

    def webhookId(webhookId)
        @path = @path.gsub("{webhook_id}", webhookId)
    end

    

  end

end