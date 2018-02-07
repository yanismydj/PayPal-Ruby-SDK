require_relative '../../test_harness'
require_relative './payments_helper'

include PayPal::V1::Payments

describe CaptureRefundRequest do
  it 'successfully makes a request' do
    create_response = PaymentsHelper::create_payment('authorize')
    auth_id = create_response.result.transactions[0].related_resources[0].authorization.id

    auth_capture_response = PaymentsHelper::create_auth_capture(auth_id)

    request = CaptureRefundRequest.new(auth_capture_response.result.id)
    request.request_body({
      :amount => {
        :total => '10',
        :currency => 'USD'
      }
    })

    resp = TestHarness::client.execute(request)

    expect(resp.status_code).to eq(201)
    expect(resp.result).not_to be_nil
    expect(resp.result.capture_id).to eq(auth_capture_response.result.id)
  end
end
