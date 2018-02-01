require_relative '../../test_harness'
require 'json'

include PayPal::V1::Invoices

describe TemplateListRequest do
  it 'successfully makes a request' do
    request = TemplateListRequest.new()
    request.fields('all')

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(200)
    expect(resp.result).not_to be_nil
  end
end
