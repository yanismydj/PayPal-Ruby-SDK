require_relative '../../test_harness'
require_relative './orders_helper'

include PayPal::V1::Orders

describe OrdersCancelRequest do
  it 'successfully makes a request' do
    create_response = OrdersHelper::create_order

    request = OrdersCancelRequest.new(create_response.result.id)

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(204)
  end
end
