require_relative '../../test_harness'
require_relative './invoice_helper'

include PayPal::V1::Invoices

describe InvoiceSearchRequest do
  it 'successfully makes a request' do
    create_response = InvoiceHelper::create_invoice

    request = InvoiceSearchRequest.new()
    request.request_body({
      :number => create_response.result.number,
    })

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(200)
    expect(resp.result).not_to be_nil
    expect(resp.result.invoices[0].id).to eq(create_response.result.id)
  end
end
