# This class was generated on Fri, 16 Jun 2017 12:36:22 PDT by version 0.01 of Braintree SDK Generator
# available_event_type_list_request.rb
# DO NOT EDIT
# @type request
# @json {"Name":"available-event-type.list","Description":"Lists available events to which any webhook can subscribe. For a list of supported events, see [Webhook event names](/docs/integration/direct/webhooks/event-names/).","Parameters":[],"RequestType":null,"ResponseType":{"Type":"EventTypeList","VariableName":"","Description":"List of webhook events.","IsArray":false,"ReadOnly":false,"Visible":false,"Required":false,"Properties":null},"ContentType":"application/json","HttpMethod":"GET","Path":"/v1/notifications/webhooks-event-types","Visible":true,"ExpectedStatusCode":200}


=begin
Lists available events to which any webhook can subscribe. For a list of supported events, see [Webhook event names](/docs/integration/direct/webhooks/event-names/).
=end

module PayPalRequest

  class AvailableEventTypeListRequest

    attr_accessor :path, :body, :headers, :verb

    def initialize()
        @headers = {"Content-Type" => "application/json"}
        @verb = "GET"
        @path = "/v1/notifications/webhooks-event-types?"
    end
  end

end