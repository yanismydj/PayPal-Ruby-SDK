require_relative '../../test_harness'
require_relative './pe_helper'
require 'json'

include PayPal::V1::PaymentExperience

describe WebProfileListRequest do
  it 'successfully makes a request' do
    create_response = PaymentExperienceHelper::create_profile

    request = WebProfileListRequest.new

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(200)
    expect(resp.result).not_to be_nil
    expect(resp.result.count > 0).to be(true)
  end
end
