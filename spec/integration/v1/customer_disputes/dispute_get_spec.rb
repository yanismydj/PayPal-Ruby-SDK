require_relative '../../test_harness'

include PayPal::V1::CustomerDisputes

describe DisputeGetRequest do

  xit 'successfully makes a request' do
    request = DisputeGetRequest.new("PP-000-042-636-306")

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(200)
    expect(resp.result).not_to be_nil

    expect(resp.result.disputed_transactions[0].gross_amount.value).to eq("10.15")
    expect(resp.result.disputed_transactions[0].gross_amount.currency_code).to eq("USD")
    expect(resp.result.reason).to eq("MERCHANDISE_OR_SERVICE_NOT_AS_DESCRIBED")
  end
end
