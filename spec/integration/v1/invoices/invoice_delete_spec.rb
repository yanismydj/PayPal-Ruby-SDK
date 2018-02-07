require_relative '../../test_harness'
require_relative './invoice_helper'
require 'json'

include PayPal::V1::Invoices

describe InvoiceDeleteRequest do
  it 'successfully makes a request' do
    create_response = InvoiceHelper::create_invoice

    request = InvoiceDeleteRequest.new(create_response.result.id)

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(204)
  end
end
