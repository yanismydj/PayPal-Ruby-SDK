require_relative '../../test_harness'

include PayPal::V1::PaymentExperience

module PaymentExperienceHelper
  class << self
    def create_profile
      profile_name = "#{Random.new.rand(1000000)}"
      body = {
        :name => profile_name,
        :flow_config => {
          :landing_page_type => 'billing',
          :bank_txn_pending_url => 'http://yeowza.com',
          :user_action => 'commit',
          :return_uri_http_method => 'GET',
        },
        :presentation => {
          :logo_image => 'http://example.com/icon.ico',
          :brand_name => 'example supply & co',
          :locale_code => 'US',
          :return_url_label => 'Return',
          :note_to_seller_label => 'Thanks',
        },
        :input_fields => {
          :allow_note => true,
          :no_shipping => 1,
          :address_override => 0,
        },
        :temporary => true,
      }

      TestHarness::exec(WebProfileCreateRequest.new, body)
    end
  end
end
