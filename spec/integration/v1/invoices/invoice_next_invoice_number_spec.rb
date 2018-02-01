require_relative '../../test_harness'
require 'json'

include PayPal::V1::Invoices

describe InvoiceNextInvoiceNumberRequest do
  it 'successfully makes a request' do
    request = InvoiceNextInvoiceNumberRequest.new()

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(200)
    expect(resp.result).not_to be_nil
  end
end
