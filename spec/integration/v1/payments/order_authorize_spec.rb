require_relative '../../test_harness'
require_relative './payments_helper'

include PayPal::V1::Payments

describe OrderAuthorizeRequest do
  it 'successfully makes a request', :skip => 'Order authoriztion requires user interaction' do
    request = OrderAuthorizeRequest.new(PaymentsHelper::FAKE_ID)
    request.request_body({
      :amount => {
        :currency => 'USD',
        :total => '10'
      }
    })

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(201)
    expect(resp.result).not_to be_nil
  end
end
