require_relative '../../test_harness'
require_relative './orders_helper'
require 'json'

include PayPal::V1::Orders

describe OrdersCreateRequest do
  it 'successfully makes a request' do
    create_response = OrdersHelper::create_order

    expect(create_response.status_code).to eq(201)
    expect(create_response.result).not_to be_nil
    expect(create_response.result.intent).to eq('SALE')
    expect(create_response.result.purchase_units.count).to eq(2)
    expect(create_response.result.purchase_units[0].reference_id).to eq('test_ref_id1')
  end
end
