require_relative '../../test_harness'

include PayPal::V1::Sync

describe SearchGetRequest do
  it 'retreives a specific transaction' do
    txn_id = '4LJ583775B2362642'
    req = SearchGetRequest.new

    req.transaction_id(txn_id)

    search_response = TestHarness::client.execute(req)
    expect(search_response.status_code).to eq(200)
    expect(search_response.result).not_to be_nil

    result = search_response.result
    expect(result.transaction_details).not_to be_nil
    expect(result.total_items).to eq(1)

    expect(result.transaction_details[0].transaction_info.transaction_id).to eq(txn_id)
  end

  it 'retreives a range of transactions' do
    request = SearchGetRequest.new()
    request.start_date("2018-01-22T00:00:00+00:00")
    request.end_date("2018-01-23T00:00:00+00:00")

    resp = TestHarness::client.execute(request)

    expect(resp.status_code).to eq(200)
    expect(resp.result).not_to be_nil
    expect(resp.result.transaction_details.count).to eq(77)
  end
end
