require_relative '../../test_harness'
require_relative './invoice_helper'

include PayPal::V1::Invoices

describe InvoiceRemindRequest do
  it 'successfully makes a request' do
    create_response = InvoiceHelper::create_invoice
    id = create_response.result.id
    InvoiceHelper::send_invoice(id)

    request = InvoiceRemindRequest.new(id)
    request.request_body({
      :subject => 'PAST DUE',
      :note => 'pony up!',
      :send_to_merchant => true
    })

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(202)
  end
end
