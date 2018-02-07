require_relative '../../test_harness'
require_relative './payments_helper'

include PayPal::V1::Payments

describe SaleRefundRequest do
  it 'successfully makes a request' do
    create_response = PaymentsHelper::create_payment('sale')
    sale_id = create_response.result.transactions[0].related_resources[0].sale.id

    request = SaleRefundRequest.new(sale_id)
    request.request_body({})

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(201)
    expect(resp.result).not_to be_nil
  end
end
