require_relative '../../test_harness'
require_relative './invoice_helper'
require 'json'

include PayPal::V1::Invoices

describe InvoiceUpdateRequest do
  it 'successfully makes a request' do
    create_response = InvoiceHelper::create_invoice

    request = InvoiceUpdateRequest.new(create_response.result.id)
    request.notify_merchant(false)
    request.request_body({
      :merchant_info => {
        :email => 'team-dx-clients-facilitator@getbraintree.com'
      },
      :terms => 'Consider this invoice updated'
    })

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(200)
    expect(resp.result).not_to be_nil
    expect(resp.result.merchant_info.email).to eq('team-dx-clients-facilitator@getbraintree.com')
    expect(resp.result.terms).to eq('Consider this invoice updated')
  end
end
