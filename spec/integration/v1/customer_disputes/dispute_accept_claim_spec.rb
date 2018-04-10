require_relative '../../test_harness'

include PayPal::V1::CustomerDisputes

describe DisputeAcceptClaimRequest do

  # Need to have a Dispute in the right state to execute test
  xit 'successfully makes a request' do
    request = DisputeAcceptClaimRequest.new("PP-000-042-635-209")
    body = {
      "note": "Accepting claim",
      "accept_claim_reason": "DID_NOT_SHIP_ITEM"
    }
    request.request_body(body)

    begin
      resp = TestHarness::client.execute(request)
      expect(resp.status_code).to eq(200)
      expect(resp.result).not_to be_nil
    rescue BraintreeHttp::HttpError => e
      puts e.status_code
      puts e.result
      throw e
    end
  end
end
