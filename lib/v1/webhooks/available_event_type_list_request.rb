# This class was generated on Thu, 01 Feb 2018 12:45:02 PST by version 0.1.0-dev+3a517e of Braintree SDK Generator
# available_event_type_list_request.rb
# @version 0.1.0-dev+3a517e
# @type request
# @data H4sIAAAAAAAC/7yUwY7TMBCG7zzFaE4gpU3hwCG31dJlJRYoUMFhVaFpMt0YUtvrmbREq747chKVpEVaCRCnyH/Gnm9+j+cB39GWMUPakaloXfGEd2x1oo3naWVEMcFXLHkwXo2zmOGNERU4xkMbL6AO9qXJSyDbwJ7XpXPfIScLUq/j9jVP4coFIIingtuA1N67oFz0RyQgzHD7pd/bimBpy7J6mhYul9RY5btAESQtTOBc0z6TpB12G54+m2KCH2oOzYICbVk5CGa3qwSvmQoOp+qVC9tTbUFanmof+b5m0WXjGTNbV1WUxDsr3GkP2H1x3sLHBdx0Jn6mYKJfvd+Y4Btufi3OPY4W7YdeSKzqIgRquiSzmJ2K97ZqMNtQJdwRmsDFUVgE5zmo4VjCb/DOydpcX+P9ywhyrI95LyxQBHuU+eWfM4sGY+/OeYsByZB3rJ/wQllvyU4CU9E28SA41qBl39d/a3lskkPyaA2xbUfwvTCmXpYMtTX3NQ8ex38iFCWtxw1xlM4pu1/RSRr3wz+hXR1WhwQvnVW2/WNE8r4yeTcavkl75deq/i1r6QrM8PV8id2jxgzT3fPUOjWbfoccx8hg+sXK5j8858rFp7aeS1cwZi9ms8OTnwAAAP//
# DO NOT EDIT
require 'cgi'

module PayPal
  module V1
    module Webhooks

      #
      # Lists available events to which any webhook can subscribe. For a list of supported events, see [Webhook event names](/docs/integration/direct/webhooks/event-names/).
      #
      class AvailableEventTypeListRequest
        attr_accessor :path, :body, :headers, :verb

        def initialize()
          @headers = {}
          @body = nil
          @verb = "GET"
          @path = "/v1/notifications/webhooks-event-types?"
          @headers["Content-Type"] = "application/json"
        end
      end
    end
  end
end
