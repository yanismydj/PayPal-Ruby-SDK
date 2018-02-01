require_relative '../../test_harness'
require_relative './invoice_helper'
require 'json'

include PayPal::V1::Invoices

describe TemplateDeleteRequest do
  it 'successfully makes a request' do
    create_response = InvoiceHelper::create_template
    request = TemplateDeleteRequest.new(create_response.result.template_id)
    resp = TestHarness::client.execute(request)

    expect(resp.status_code).to eq(204)
  end
end
