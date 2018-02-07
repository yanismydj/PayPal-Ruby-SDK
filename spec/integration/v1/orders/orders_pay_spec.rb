require_relative '../../test_harness'
require_relative './orders_helper'
require 'json'

include PayPal::V1::Orders

describe OrdersPayRequest do
  it 'successfully makes a request', :skip => 'This test is an example, in production, orders require payer approval' do
    create_response = OrdersHelper::create_order
    request = OrdersPayRequest.new(create_response.result.id)
    request.request_body({
      :disbursement_mode => 'INSTANT',
    })

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(202)
    expect(resp.result).not_to be_nil
  end
end
