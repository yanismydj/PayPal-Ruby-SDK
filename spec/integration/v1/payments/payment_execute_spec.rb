require_relative '../../test_harness'
require_relative './payments_helper'

include PayPal::V1::Payments

describe PaymentExecuteRequest do
  it 'successfully makes a request', :skip => 'payer must approve payment in order flows' do
    create_response = PaymentsHelper::create_payment('order', 'paypal')

    request = PaymentExecuteRequest.new(create_response.result.id)
    request.request_body({
      :payer_id => 'some-payer-id'
    })

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(200)
    expect(resp.result).not_to be_nil
  end
end
