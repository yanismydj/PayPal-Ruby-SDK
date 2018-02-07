require_relative '../../test_harness'

include PayPal::V1::BillingPlans

module PlanHelper
  class << self
    def activate_plan(plan_id)
      request_body = [
        {
          :op => 'replace',
          :path => '/',
          :value => {
            :state => 'ACTIVE',
          },
        },
      ]

      activate_request = PlanUpdateRequest.new(plan_id)
      activate_request.request_body(request_body)

      TestHarness::client.execute(activate_request)
    end

    def create_plan
      request_body = {
        "payment_definitions": [{
          "amount": {
            "value": "100",
            "currency": "USD",
          },
          "frequency": "MONTH",
          "cycles": "12",
          "frequency_interval": "2",
          "type": "REGULAR",
          "name": "Regular Payments",
          "charge_models": [{
            "type": "SHIPPING",
            "amount": {
              "value": "10",
              "currency": "USD",
            },
          }, {
            "type": "TAX",
            "amount": {
              "value": "12",
              "currency": "USD",
            },
          }],
        }],
        "merchant_preferences": {
          "return_url": "http://localhost:3000/subscription/success",
          "cancel_url": "http://localhost:3000/subscription/cancel",
        },
        "name": "T-Shirt of the Month Club Plan",
        "description": "Template creation.",
        "type": "fixed",
      }

      request = PlanCreateRequest.new()
      request.request_body(request_body)

      TestHarness::client.execute(request)
    end

    def get_plan(plan_id)
      request = PlanGetRequest.new(plan_id)

      TestHarness::client.execute(request)
    end
  end
end
