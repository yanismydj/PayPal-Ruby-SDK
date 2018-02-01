require_relative '../../test_harness'
require_relative './pe_helper'

include PayPal::V1::PaymentExperience

describe WebProfileUpdateRequest do
  it 'successfully makes a request' do
    create_response = PaymentExperienceHelper::create_profile

    profile_name = "Updated #{Random.new.rand(1000000)}"
    body = {
      :name => profile_name,
      :flow_config => {
        :landing_page_type => 'billing',
        :bank_txn_pending_url => 'http://updated.com',
        :user_action => 'commit',
        :return_uri_http_method => 'GET'
      },
      :presentation => {
        :logo_image => 'http://example.com/icon.ico',
        :brand_name => 'example supply & co',
        :locale_code => 'US',
        :return_url_label => 'Return',
        :note_to_seller_label => 'Thanks'
      },
      :input_fields => {
        :allow_note => true,
        :no_shipping => 1,
        :address_override => 0
      },
      :temporary => true
    }

    request = WebProfileUpdateRequest.new(create_response.result.id)
    request.request_body(body)

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(204)

    get_resp = TestHarness::client.execute(WebProfileGetRequest.new(create_response.result.id))
    expect(get_resp.result.flow_config.bank_txn_pending_url).to eq('http://updated.com')
    expect(get_resp.result.name).to eq(profile_name)
  end
end
