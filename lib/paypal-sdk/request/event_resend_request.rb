# This class was generated on Fri, 16 Jun 2017 12:36:22 PDT by version 0.01 of Braintree SDK Generator
# event_resend_request.rb
# DO NOT EDIT
# @type request
# @json {"Name":"event.resend","Description":"Resends a webhook event notification, by ID. Any pending notifications are not resent.","Parameters":[{"Type":"string","VariableName":"event_id","Description":"The ID of the webhook event notification to resend.","IsArray":false,"ReadOnly":false,"Visible":false,"Required":true,"Properties":null,"Location":"path"}],"RequestType":{"Type":"Event Resend","VariableName":"body","Description":"Resends a webhook event notification, by ID.","IsArray":false,"ReadOnly":false,"Visible":false,"Required":false,"Properties":null},"ResponseType":{"Type":"Event","VariableName":"","Description":"A webhook event notification.","IsArray":false,"ReadOnly":false,"Visible":false,"Required":false,"Properties":null},"ContentType":"application/json","HttpMethod":"POST","Path":"/v1/notifications/webhooks-events/{event_id}/resend","Visible":true,"ExpectedStatusCode":200}


=begin
Resends a webhook event notification, by ID. Any pending notifications are not resent.
=end

module PayPalRequest

  class EventResendRequest

    attr_accessor :path, :body, :headers, :verb

    def initialize()
        @headers = {"Content-Type" => "application/json"}
        @verb = "POST"
        @path = "/v1/notifications/webhooks-events/{event_id}/resend?"
    end

    def eventId(eventId)
        @path = @path.gsub("{event_id}", eventId)
    end
    
    def requestBody(body)
        @body = body
    end
  end

end