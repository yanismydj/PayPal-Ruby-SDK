require_relative '../../test_harness'
require 'json'

include PayPal::V1::Webhooks

describe AvailableEventTypeListRequest do
  it 'successfully makes a request' do
    request = AvailableEventTypeListRequest.new()

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(200)
    expect(resp.result).not_to be_nil
    expect(resp.result.event_types).not_to be_nil
    expect(resp.result.event_types.count > 0).to be(true)
  end
end
