require_relative '../../test_harness'
require_relative './invoice_helper'

include PayPal::V1::Invoices

describe InvoiceDeleteExternalRefundRequest do
  it 'successfully makes a request' do
    create_response = InvoiceHelper::create_invoice
    id = create_response.result.id

    InvoiceHelper::record_refund(id)

    get_response = InvoiceHelper::get_invoice(id)
    refund_id = get_response.result.refunds[0].transaction_id

    request = InvoiceDeleteExternalRefundRequest.new(id, refund_id)

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(204)
  end
end
