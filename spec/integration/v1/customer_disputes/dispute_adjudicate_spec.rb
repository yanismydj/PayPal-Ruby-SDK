require_relative '../../test_harness'

include PayPal::V1::CustomerDisputes

describe DisputeAdjudicateRequest do
  xit 'successfully makes a request' do
    request = DisputeAdjudicateRequest.new("PP-000-042-635-209")
    body = {
      "adjudication_outcome": "BUYER_FAVOR"
    }
    request.request_body(body);

    begin
      resp = TestHarness::client.execute(request)
      expect(resp.status_code).to eq(200)
      expect(resp.result).not_to be_nil
    rescue BraintreeHttp::HttpError => e
      puts e.status_code
      puts e.result
    end
  end
end
