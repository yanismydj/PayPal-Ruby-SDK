

require_relative '../../test_harness'
require_relative '../../../lib/lib'
require 'json'

include PayPal::V1::Payments

describe CaptureGetRequest do
  it 'successfully makes a request' do
    request = CaptureGetRequest.new("7Scg8ThRTi")

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(200)
    expect(resp.result).not_to be_nil

    # Add your own checks here
  end
end
