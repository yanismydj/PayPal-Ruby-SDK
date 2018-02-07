require_relative '../../test_harness'
require_relative './invoice_helper'

include PayPal::V1::Invoices

describe InvoiceDeleteExternalPaymentRequest do
  it 'successfully makes a request' do
    create_response = InvoiceHelper::create_invoice
    id = create_response.result.id
    InvoiceHelper::record_payment(id)

    get_response = InvoiceHelper::get_invoice(id)

    txn_id = get_response.result.payments[0].transaction_id
    request = InvoiceDeleteExternalPaymentRequest.new(id, txn_id)

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(204)

    get_response = InvoiceHelper::get_invoice(id)
    expect(get_response.result.payments).to be_nil
  end
end
