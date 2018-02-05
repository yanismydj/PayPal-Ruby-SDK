require_relative '../../test_harness'
require_relative './payments_helper'

include PayPal::V1::Payments

describe OrderCaptureRequest do
  it 'successfully makes a request', :skip => 'Order capturing requires user interaction' do
    request = OrderCaptureRequest.new(PaymentsHelper::FAKE_ID)
    request.request_body({
      :amount => {
        :total => '10',
        :currency => 'USD'
      },
      :is_final_capture => true
    })

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(201)
    expect(resp.result).not_to be_nil
  end
end
