require_relative '../../test_harness'
require_relative './invoice_helper'

include PayPal::V1::Invoices

describe InvoiceGetRequest do
  it 'successfully makes a request' do
    create_response = InvoiceHelper::create_invoice

    request = InvoiceGetRequest.new(create_response.result.id)

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(200)
    expect(resp.result).not_to be_nil

    expect(resp.result.id).to eq(create_response.result.id)
  end
end
