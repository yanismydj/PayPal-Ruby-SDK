require_relative '../../test_harness'
require_relative './invoice_helper'
require 'json'

include PayPal::V1::Invoices

describe InvoiceSendRequest do
  it 'successfully makes a request' do
    create_response = InvoiceHelper::create_invoice

    send_response = InvoiceHelper::send_invoice(create_response.result.id)

    expect(send_response.status_code).to eq(202)
  end
end
