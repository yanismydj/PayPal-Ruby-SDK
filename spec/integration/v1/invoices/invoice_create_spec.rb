require_relative '../../test_harness'
require_relative './invoice_helper'
require 'json'

include PayPal::V1::Invoices

describe InvoiceCreateRequest do
  it 'successfully makes a request' do
    invoice_create_response = InvoiceHelper::create_invoice

    expect(invoice_create_response.status_code).to eq(201)
    expect(invoice_create_response.result).not_to be_nil
    expect(invoice_create_response.result.merchant_info.first_name).to eq('Dennis')
  end
end
