require_relative '../../test_harness'
require_relative './pe_helper'

include PayPal::V1::PaymentExperience

describe WebProfileDeleteRequest do
  it 'successfully makes a request' do
    create_response = PaymentExperienceHelper::create_profile

    request = WebProfileDeleteRequest.new(create_response.result.id)

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(204)
  end
end
