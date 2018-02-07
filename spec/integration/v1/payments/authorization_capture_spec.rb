require_relative '../../test_harness'
require_relative './payments_helper'

include PayPal::V1::Payments

describe AuthorizationCaptureRequest do
  it 'successfully makes a request' do
    create_response = PaymentsHelper::create_payment('authorize')
    auth_id = create_response.result.transactions[0].related_resources[0].authorization.id

    auth_capture_response = PaymentsHelper::create_auth_capture(auth_id)

    expect(auth_capture_response.status_code).to eq(200)
    expect(auth_capture_response.result).not_to be_nil
    expect(auth_capture_response.result.parent_payment).to eq(create_response.result.id)
  end
end
