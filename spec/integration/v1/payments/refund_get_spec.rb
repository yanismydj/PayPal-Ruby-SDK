require_relative '../../test_harness'
require_relative './payments_helper'

include PayPal::V1::Payments

describe RefundGetRequest do
  it 'successfully makes a request' do
    create_response = PaymentsHelper::create_payment('sale')
    sale_id = create_response.result.transactions[0].related_resources[0].sale.id

    refund_response = TestHarness::exec(SaleRefundRequest.new(sale_id), {})
    request = RefundGetRequest.new(refund_response.result.id)

    resp = TestHarness::client.execute(request)

    expect(resp.status_code).to eq(200)
    expect(resp.result).not_to be_nil
  end
end
