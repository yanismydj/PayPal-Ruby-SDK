require_relative '../../test_harness'

include PayPal::V1::Orders

module OrdersHelper
  class << self
    def create_order
      body = {
        :intent => 'SALE',
        :purchase_units => [{
          :reference_id => 'test_ref_id1',
          :amount => {
            :total => '100.00',
            :currency => 'USD',
          }
        }, {
          :reference_id => 'test_ref_id2',
          :amount => {
            :total => '50.00',
            :currency => 'USD',
          }
        }],
        :redirect_urls => {
          :cancel_url => 'https://example.com/cancel',
          :return_url => 'https://example.com/return'
        }
      }

      TestHarness::exec(OrdersCreateRequest.new, body)
    end

    def get_order(id)
      TestHarness::exec(OrdersGetRequest.new(id))
    end
  end
end
