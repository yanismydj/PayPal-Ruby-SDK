require_relative '../../test_harness'
require_relative './payments_helper'
require 'json'

include PayPal::V1::Payments

describe AuthorizationReauthorizeRequest do
  it 'successfully makes a request', :skip => 'creating a reauthorization on a paypal payment method requires user interaction' do
    create_response = PaymentsHelper::create_payment('authorize', payment_method='paypal')
    auth_id = create_response.result.transactions[0].related_resources[0].authorization.id

    request = AuthorizationReauthorizeRequest.new(auth_id)
    body = {
      :amount => {
        :total => '10',
        :currency => 'USD'
      }
    }

    request.request_body(body)

      resp = TestHarness::client.execute(request)
      expect(resp.status_code).to eq(201)
      expect(resp.result).not_to be_nil
  end
end
