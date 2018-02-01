require_relative '../../test_harness'
require_relative './invoice_helper'
require 'json'

include PayPal::V1::Invoices

describe InvoiceRecordPaymentRequest do
  it 'successfully makes a request' do
    create_response = InvoiceHelper::create_invoice
    record_response = InvoiceHelper::record_payment(create_response.result.id)

    expect(record_response.status_code).to eq(204)
  end
end
