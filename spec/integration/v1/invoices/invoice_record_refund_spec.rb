require_relative '../../test_harness'
require_relative './invoice_helper'
require 'json'

include PayPal::V1::Invoices

describe InvoiceRecordRefundRequest do
  it 'successfully makes a request' do
    create_response = InvoiceHelper::create_invoice
    refund_response = InvoiceHelper::record_refund(create_response.result.id)

    expect(refund_response.status_code).to eq(204)
  end
end
