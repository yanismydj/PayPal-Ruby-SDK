require_relative '../../test_harness'
require_relative './payments_helper'

include PayPal::V1::Payments

describe SaleGetRequest do
  it 'successfully makes a request' do
    create_response = PaymentsHelper::create_payment('sale')
    sale_id = create_response.result.transactions[0].related_resources[0].sale.id

    request = SaleGetRequest.new(sale_id)
    resp = TestHarness::client.execute(request)

    expect(resp.status_code).to eq(200)
    expect(resp.result).not_to be_nil
    expect(resp.result.id).to eq(sale_id)
  end
end
