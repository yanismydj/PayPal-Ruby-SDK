require_relative '../../test_harness'

include PayPal::V1::Vault

module VaultHelper
  class << self
    def create_card
      body = {
        :number => '4417119669820331',
        :type => 'visa',
        :expire_month => '11',
        :expire_year => '2055',
        :first_name => 'Joe',
        :last_name => 'Shopper',
        :billing_address => {
          :line1 => '123 main st',
          :city => 'San Francisco',
          :country_code => 'US',
          :postal_code => '94117',
          :state => 'CA',
          :phone => '123-456-7890'
        }
      }

      TestHarness::exec(CreditCardCreateRequest.new(), body)
    end
  end
end
