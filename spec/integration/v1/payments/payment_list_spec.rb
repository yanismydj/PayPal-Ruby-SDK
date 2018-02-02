

require_relative '../../test_harness'
require_relative '../../../lib/lib'
require 'json'

include PayPal::V1::Payments

describe PaymentListRequest do
  it 'successfully makes a request' do
    request = PaymentListRequest.new()
    request.count(4)
    request.end_time("TBprt ZIUxwFVfzI")
    request.payee_id("5fSpKzByvpxxI1Z5")
    request.sort_by("She1 BKFYAKFxfx0tJ1")
    request.sort_order("RbwWhiKcMqL52Xz")
    request.start_id("OIrR u NQA8rZ")
    request.start_index(8)
    request.start_time("g9ZeFyq7c2 VxZQPCW2")

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(200)
    expect(resp.result).not_to be_nil

    # Add your own checks here
  end
end
