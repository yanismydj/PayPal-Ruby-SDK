# This class was generated on Fri, 16 Jun 2017 12:36:22 PDT by version 0.01 of Braintree SDK Generator
# event_get_request.rb
# DO NOT EDIT
# @type request
# @json {"Name":"event.get","Description":"Shows details for a webhook event notification, by ID.","Parameters":[{"Type":"string","VariableName":"event_id","Description":"The ID of the webhook event notification for which to show details.","IsArray":false,"ReadOnly":false,"Visible":false,"Required":true,"Properties":null,"Location":"path"}],"RequestType":null,"ResponseType":{"Type":"Event","VariableName":"","Description":"A webhook event notification.","IsArray":false,"ReadOnly":false,"Visible":false,"Required":false,"Properties":null},"ContentType":"application/json","HttpMethod":"GET","Path":"/v1/notifications/webhooks-events/{event_id}","Visible":true,"ExpectedStatusCode":200}


=begin
Shows details for a webhook event notification, by ID.
=end

module PayPalRequest

  class EventGetRequest

    attr_accessor :path, :body, :headers, :verb

    def initialize()
        @headers = {"Content-Type" => "application/json"}
        @verb = "GET"
        @path = "/v1/notifications/webhooks-events/{event_id}?"
    end

    def eventId(eventId)
        @path = @path.gsub("{event_id}", eventId)
    end
  end

end