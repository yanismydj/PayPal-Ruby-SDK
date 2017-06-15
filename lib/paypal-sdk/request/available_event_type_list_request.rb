# This class was generated on Thu, 15 Jun 2017 16:02:42 PDT by version 0.01 of Braintree SDK Generator
# available_event_type_list_request.rb
# DO NOT EDIT
# @type request
# @json {"Name":"available-event-type.list","Description":"Lists available events to which any webhook can subscribe. For a list of supported events, see [Webhook event names](/docs/integration/direct/webhooks/event-names/).","Parameters":[],"RequestType":null,"ResponseType":{"Type":"EventTypeList","VariableName":"","Description":"List of webhook events.","IsArray":false,"ReadOnly":false,"Visible":false,"Required":false,"Properties":null},"ContentType":"application/json","HttpMethod":"GET","Path":"/v1/notifications/webhooks-event-types","Visible":true,"ExpectedStatusCode":200}

require 'net/http'

=begin
Lists available events to which any webhook can subscribe. For a list of supported events, see [Webhook event names](/docs/integration/direct/webhooks/event-names/).
=end

module PayPalRequest

  class AvailableEventTypeListRequest < Net::HTTPGenericRequest

    def initialize()
      initheader = {"Content-Type" => "application/json"}
      super "GET", true, true, "/v1/notifications/webhooks-event-types?", initheader
    end

    

  end

end