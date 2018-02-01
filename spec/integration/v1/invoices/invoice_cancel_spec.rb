require_relative '../../test_harness'
require_relative './invoice_helper'
require 'json'

include PayPal::V1::Invoices

describe InvoiceCancelRequest do
  it 'successfully makes a request' do
    create_response = InvoiceHelper::create_invoice
    InvoiceHelper::send_invoice(create_response.result.id)

    request = InvoiceCancelRequest.new(create_response.result.id)
    request.request_body({
      :subject => 'Past Due',
      :note => 'nevermind',
      :send_to_merchant => true,
      :send_to_payer => true
    })

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(204)
  end
end
