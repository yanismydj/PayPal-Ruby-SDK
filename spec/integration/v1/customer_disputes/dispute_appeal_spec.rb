require_relative '../../test_harness'
require 'braintreehttp'

include PayPal::V1::CustomerDisputes

describe DisputeAppealRequest do

  # Need to have a Dispute in the right state to execute test
  xit 'successfully makes a request' do
    request = DisputeAppealRequest.new("PP-000-042-635-183")
    file = File.new("./spec/integration/v1/customer_disputes/test_image.png")
    puts file.size
    body = {
      input: BraintreeHttp::FormPart.new({
        evidence_type: 'OTHER',
        notes: 'Notes'
      }, {
        'Content-Type': 'application/json'
      }),
      file1: file
    }
    request.request_body(body)

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
