

require_relative '../../test_harness'
require_relative '../../../lib/lib'
require 'json'

include PayPal::V1::Invoices

describe InvoiceCancelRequest do
  def build_request_body
    return JSON.parse('{"cc_emails":["D1tbwWfJDf ","3ZdrXqE1 JD3"],"note":"TPNXIhDUqPCZuUKpOz","send_to_merchant":true,"send_to_payer":true,"subject":"EMFwSsVAbsXDdp0Z"}')
  end

  it 'successfully makes a request' do
    request = InvoiceCancelRequest.new("CMavupaQbed85WwK")
    request.request_body(build_request_body)

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(200)

    # Add your own checks here
  end
end
