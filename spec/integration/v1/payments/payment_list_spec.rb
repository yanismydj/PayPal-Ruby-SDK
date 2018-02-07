require_relative '../../test_harness'
require_relative './payments_helper'

include PayPal::V1::Payments

describe PaymentListRequest do
  it 'successfully makes a request' do
    request = PaymentListRequest.new()
    request.count(10)

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(200)
    expect(resp.result).not_to be_nil
    expect(resp.result.payments.count <= 10).to be(true)
  end
end
