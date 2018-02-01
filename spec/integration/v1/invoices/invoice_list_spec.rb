require_relative '../../test_harness'
require_relative './invoice_helper'

include PayPal::V1::Invoices

describe InvoiceListRequest do
  it 'successfully makes a request' do
    InvoiceHelper::create_invoice

    request = InvoiceListRequest.new
    request.page(8)
    request.page_size(7)
    request.total_count_required(true)

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(200)
    expect(resp.result).not_to be_nil
    expect(resp.result.total_count > 0).to be(true)
  end
end
