# This class was generated on Thu, 15 Jun 2017 16:02:42 PDT by version 0.01 of Braintree SDK Generator
# event_get_request.rb
# DO NOT EDIT
# @type request
# @json {"Name":"event.get","Description":"Shows details for a webhook event notification, by ID.","Parameters":[{"Type":"string","VariableName":"event_id","Description":"The ID of the webhook event notification for which to show details.","IsArray":false,"ReadOnly":false,"Visible":false,"Required":true,"Properties":null,"Location":"path"}],"RequestType":null,"ResponseType":{"Type":"Event","VariableName":"","Description":"A webhook event notification.","IsArray":false,"ReadOnly":false,"Visible":false,"Required":false,"Properties":null},"ContentType":"application/json","HttpMethod":"GET","Path":"/v1/notifications/webhooks-events/{event_id}","Visible":true,"ExpectedStatusCode":200}

require 'net/http'

=begin
Shows details for a webhook event notification, by ID.
=end

module PayPalRequest

  class EventGetRequest < Net::HTTPGenericRequest

    def initialize()
      initheader = {"Content-Type" => "application/json"}
      super "GET", true, true, "/v1/notifications/webhooks-events/{event_id}?", initheader
    end

    def eventId(eventId)
        @path = @path.gsub("{event_id}", eventId)
    end

    

  end

end