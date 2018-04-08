require_relative '../../test_harness'

include PayPal::V1::CustomerDisputes

describe DisputeListRequest do

  xit 'successfully makes a request' do
    request = DisputeListRequest.new()

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(200)
    expect(resp.result).not_to be_nil

    puts resp.result.inspect
    expect(resp.result.items.count > 0).to be(true)
  end
end
