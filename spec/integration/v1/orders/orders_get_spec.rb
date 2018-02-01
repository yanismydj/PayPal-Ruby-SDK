require_relative '../../test_harness'
require_relative './orders_helper'

include PayPal::V1::Orders

describe OrdersGetRequest do
  it 'successfully makes a request' do
    create_response = OrdersHelper::create_order

    request = OrdersGetRequest.new(create_response.result.id)

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(200)
    expect(resp.result).not_to be_nil
    expect(resp.result.id).to eq(create_response.result.id)
    expect(resp.result.purchase_units[0].reference_id).to eq('test_ref_id1')
  end
end
