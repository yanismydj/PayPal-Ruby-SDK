# This class was generated on Fri, 16 Jun 2017 10:45:02 PDT by version 0.01 of Braintree SDK Generator
# simulate_event_request.rb
# DO NOT EDIT
# @type request
# @json {"Name":"simulate.event","Description":"Simulates a webhook event. Specify a sample payload.","Parameters":[],"RequestType":{"Type":"Simulate Event","VariableName":"body","Description":"Uses a sample payload to simulate a mock webhook event.","IsArray":false,"ReadOnly":false,"Visible":false,"Required":false,"Properties":null},"ResponseType":{"Type":"Event","VariableName":"","Description":"A webhook event notification.","IsArray":false,"ReadOnly":false,"Visible":false,"Required":false,"Properties":null},"ContentType":"application/json","HttpMethod":"POST","Path":"/v1/notifications/simulate-event","Visible":true,"ExpectedStatusCode":200}

require 'net/http'

=begin
Simulates a webhook event. Specify a sample payload.
=end

module PayPalRequest

  class SimulateEventRequest < Net::HTTPGenericRequest

    def initialize()
      initheader = {"Content-Type" => "application/json"}
      super "POST", true, true, "/v1/notifications/simulate-event?", initheader
    end

    
    
    def data(body)
        @body = body
    end

  end

end