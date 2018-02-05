require_relative '../../test_harness'
require_relative './payments_helper'

include PayPal::V1::Payments

describe OrderVoidRequest do
  it 'successfully makes a request', :skip => 'Order voiding requires user interaction' do
    request = OrderVoidRequest.new(PaymentsHelper::FAKE_ID)

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(200)
    expect(resp.result).not_to be_nil
  end
end
