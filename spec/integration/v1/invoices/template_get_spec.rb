require_relative '../../test_harness'
require_relative './invoice_helper'

include PayPal::V1::Invoices

describe TemplateGetRequest do
  it 'successfully makes a request' do
    create_response = InvoiceHelper::create_invoice

    request = TemplateGetRequest.new(create_response.result.template_id)

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(200)
    expect(resp.result).not_to be_nil

    expect(resp.result.template_id).to eq(create_response.result.template_id)
  end
end
