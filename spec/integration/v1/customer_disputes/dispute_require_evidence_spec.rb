require_relative '../../test_harness'

include PayPal::V1::CustomerDisputes

describe DisputeRequireEvidenceRequest do
  xit 'successfully makes a request' do
    request = DisputeRequireEvidenceRequest.new("PP-000-042-636-306")
    body = {
      "action": "SELLER_EVIDENCE"
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
