# This class was generated on Wed, 31 Jan 2018 15:11:19 PST by version 0.1.0-dev+6a771d-dirty of Braintree SDK Generator
# agreement_re_activate_request.rb
# @version 0.1.0-dev+6a771d-dirty
# @type request
# @data H4sIAAAAAAAC/6RUwW7bMAy97ysInt24G3byLWg2NBvWZE2wy1CktMXEKhzJpehuRpB/Hxy7TuIAHYZdbOiJIvneo7TDO9oyJkgbYd6y05HwFWVqX0gZI5xwyMSWar3DBO+PewEIQhVKdoYNpLYorNtAnyaCtIbpZARTB5ozfFnM7kD4ueKgkHpTR2BdVlSGgRw89udWQUl5ZbqyXh7Bp0+cKfyymrcfAueVQXNSaANTDocqwhS8g7WXbvnarvUOyJkD2tcC2vqq+TkDWSXCLqtHGOH3iqWek9CWlSVg8vMhwlsmwzJEP3vZDrE5aX6G7XBZl43IQcW6DUb4g8RSWvBQ/JU1GOFXrruNCwOWOcN0An49YKL+hCw3JMYiVLd1ryO8ZzIzV9SYrKkI3ADPlRU2mKhUHOFcfMmilgMmriqK/UMbw0HbJD2JcV900VgFk96qt4gNbT2j+WbYuQBjMMf1qw6teQqH0xfi/JMaHXAqx9/9a8bxjFAHXHo3GNCjgW3rWU5uw//bcOvfvokKpXeB2zwNHOGNd8quMxWpLAubHe5H/BS8wwhvVctvrLk3mOB8tlhiO9KYYPzyPi6pbhoOcXflr3oOId6dDvI+Pn9JPv0uOVM2zdRU4cYbxuTD9cf9uz8AAAD//w==
# DO NOT EDIT

require 'uri'

module PayPal
  module V1
    module BillingAgreements

      #
      # Re-activates a suspended billing agreement, by ID. In the JSON request body, include an `agreement_state_descriptor` object with with a note that describes the reason for the re-activation and the agreement amount and currency.
      #
      class AgreementReActivateRequest
        attr_accessor :path, :body, :headers, :verb

        def initialize(agreement_id)
          @headers = {}
          @body = nil
          @verb = "POST"
          @path = "/v1/payments/billing-agreements/{agreement_id}/re-activate?"

          @path = @path.gsub("{agreement_id}", URI.escape(agreement_id.to_s))
          @headers["Content-Type"] = "application/json"
        end

        def request_body(agreementStateDescriptor)
          @body = agreementStateDescriptor
        end
      end
    end
  end
end
