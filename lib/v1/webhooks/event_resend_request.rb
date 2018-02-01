# This class was generated on Thu, 01 Feb 2018 12:45:02 PST by version 0.1.0-dev+3a517e of Braintree SDK Generator
# event_resend_request.rb
# @version 0.1.0-dev+3a517e
# @type request
# @data H4sIAAAAAAAC/8yXXVPjNhfH759PcUZPL2DGselS6G7uMgs7ZLotNGR7wzDkxD6JtdiSKx0TXIbv3pFlBxzzsi+U9tJHsnR+5y/9Jd2I3zAnMRR0RYpDQ5ZUIgJxQDY2smCplRiKSR22gLCiear1JdTdQWmWCxmj6xbAvILxQQgjVUFBKpFq2elgAQ25CNSzcCgC8XtJpjpBgzkxGSuGZ+eBOCJMyGxGP2iTb8ZOkNNO7EZMq8LhWDZSLUUg/kAjcZ7RfcwL6RB/oaoJ9ninKcH4APQCOKUnmIG1h0kczMgYrPz8O4GYECbHKqvEcIGZJRf4s5SGEjFkU1IgTowuyLAkK4aqzLLbc9+HLPtB1jCH9cSTVpuHkAZr5e6wNhq+XdKvYWsC9+GeV6VJ4UImtkPQjXcBRgrQJeVUahEwjnWpGMYHdiPp/a9N2ity63rZQitLD2nSJ3l6XY2eKPY/X+XYEDJdsMypk2Y33t8JCTIBqgRcD1ilpJ7bFiu04EdNApAKzsaKySjijbEW2uTI51spc2GHUcRaZzaUxItQm2WUcp5FZhHv7u6++7+l2I092Av3t7+3VrW4wReaBbtOvX3Vhvvl8vXgFBnYyOWSDCXPFOxVea7IWJdtH+mu5TGqpofT9D7Rv8CyYeEy+WYTf+GEP0p1CfcygeP5Z4ofsIpMqsuu3bWRx43O+PNhYChzmwvOjkbTw+PRKdS/nm9FiY5thIWMUmTSaAd1w/b3uuHz5pIaWnRgmkBfk1jnRUZMwGiWxPBp8jGEqYYcL6mWqoWLMcsC130ulW/JiVOdwEpyCpxKW2N7h/k0GQNTXrhfv9RX9vd+3tkOYazirEz8DLMfZgHMtmZBbVKz7RnEKRqM3f3CDQuFoUFhdEzWSrUMwRHNHOsMpK2HuKQKWlkcq1ZrP6jFAFyXwDN6HgRbzq3TV3EdfqWN5GvakW4d6ot3NJ2etDKYZnZ3C3pQvFciMJR10vff/dzPXPl9gvXdrSro2SWy9+7t2/XR89N2AKtUxilYMldkAS2gcibjVgbW8nqhS4X5XC5LXdqsgqROZU5+fVjKUbGMbWtN7rcQTongrDaPSZOhvctutVqFEhXWuaG1cqlyUmwj9++gRdr8DK8dxsucluf3hNCPOJohq0sT04Ya62BfkrbxP3lctsn1bwCbLX0whTm1+q4h273B+tHT09O+EqAt8xxN1UG7i21eXZuWZjX7s82te17fDjoawQdtgK7ROV0AsxEUWLk1C1hyqo38q3dVDGcvtFDFe62YVPOMElgUWZNV9NnW95sj5uJX73JDcXJ8OhX+MSmGIrr6Meo8W6NGJzuoKW100z4ib6P14+rwuqCYKTll5NK+1wmJ4ZudN7f/+xsAAP//
# DO NOT EDIT
require 'cgi'

module PayPal
  module V1
    module Webhooks

      #
      # Resends a webhook event notification, by ID. Any pending notifications are not resent.
      #
      class EventResendRequest
        attr_accessor :path, :body, :headers, :verb

        def initialize(event_id)
          @headers = {}
          @body = nil
          @verb = "POST"
          @path = "/v1/notifications/webhooks-events/{event_id}/resend?"

          @path = @path.gsub("{event_id}", CGI::escape(event_id.to_s))
          @headers["Content-Type"] = "application/json"
        end

        def request_body(eventResend)
          @body = eventResend
        end
      end
    end
  end
end
