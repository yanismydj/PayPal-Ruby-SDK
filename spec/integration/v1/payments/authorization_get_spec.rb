require_relative '../../test_harness'
require_relative './payments_helper'

include PayPal::V1::Payments

describe AuthorizationGetRequest do
  it 'successfully makes a request' do
    create_response = PaymentsHelper::create_payment('authorize')
    auth_id = create_response.result.transactions[0].related_resources[0].authorization.id

    request = AuthorizationGetRequest.new(auth_id)

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(200)
    expect(resp.result).not_to be_nil
    expect(resp.result.id).to eq(auth_id)
  end
end
