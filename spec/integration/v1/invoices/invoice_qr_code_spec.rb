require_relative '../../test_harness'
require_relative './invoice_helper'

include PayPal::V1::Invoices

describe InvoiceQrCodeRequest do
  it 'successfully makes a request' do
    create_response = InvoiceHelper::create_invoice

    request = InvoiceQrCodeRequest.new(create_response.result.id)
    request.height(300)
    request.width(200)

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(200)
    expect(resp.result).not_to be_nil
  end
end
