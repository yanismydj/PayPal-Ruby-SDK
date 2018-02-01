require_relative '../../test_harness'
require_relative './pe_helper'
require 'json'

include PayPal::V1::PaymentExperience

describe WebProfilePartialUpdateRequest do
  it 'successfully makes a request' do
    create_response = PaymentExperienceHelper::create_profile

    request = WebProfilePartialUpdateRequest.new(create_response.result.id)
    request.request_body([
      {
        :op => 'add',
        :path => '/presentation/brand_name',
        :value => 'example supply and company'
      },
      {
        :op => 'remove',
        :path => '/flow_config/landing_page_type'
      }
    ])

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(204)

    get_resp = TestHarness::client.execute(WebProfileGetRequest.new(create_response.result.id))

    expect(get_resp.result.presentation.brand_name).to eq('example supply and company')
    expect(get_resp.result.presentation.landing_page_type).to be_nil
  end
end
