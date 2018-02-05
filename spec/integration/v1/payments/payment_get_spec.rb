require_relative '../../test_harness'
require_relative './payments_helper'

include PayPal::V1::Payments

describe PaymentGetRequest do
  it 'successfully makes a request' do
    create_response = PaymentsHelper::create_payment('authorize')

    request = PaymentGetRequest.new(create_response.result.id)

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(200)
    expect(resp.result).not_to be_nil
    expect(resp.result.id).to eq(create_response.result.id)
  end
end
