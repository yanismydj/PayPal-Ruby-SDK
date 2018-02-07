# This class was generated on Thu, 01 Feb 2018 12:44:52 PST by version 0.1.0-dev+3a517e of Braintree SDK Generator
# orders_cancel_request.rb
# @version 0.1.0-dev+3a517e
# @type request
# @data H4sIAAAAAAAC/2SSTY/TMBCG7/yK0ZytZkGcfKuaoF3xsaFEe0ErOo1nicGxw3iCiKr+d5RkEaVcn3mVzPuMT/iBekaLSRxL3rQUWw5osOTcih/Up4gWdwvOQBGWoIHjBHelAYoOHAdWzqAdr9MNNAlaCgG08xl61i4583cOWUnHDP2YFY4McNjtq21TlQdIAodtXe/vH6rysEGDH0eWqSahnpUlo/38aPCWybFc0zdJ+mtWk3b/sBM20zAXzio+fkWDDySejoEvRXzxDg2+5ekZ/iek6RjuSkhPF610Lj17mvfeitC0/urG4J7J3ccwoX2ikHkGP0Yv7NCqjGywljSwqOeMNo4hnB/XDGddPzLDGeUhxcyXbJeicnyOIQ1D8C3Naxbfcopo8FZ1eL/cAC2W1buqqXA1gxaLny+LtuP2exq1WB9Bcfrj4IwGq18Dt8ru03KzXXKM9tXN6/OL3wAAAP//
# DO NOT EDIT
require 'cgi'

module PayPal
  module V1
    module Orders

      #
      # Cancels an order, by ID, and deletes the order. To call this method, the order status must be  `CREATED` or `APPROVED`.
      #
      class OrdersCancelRequest
        attr_accessor :path, :body, :headers, :verb

        def initialize(order_id)
          @headers = {}
          @body = nil
          @verb = "DELETE"
          @path = "/v1/checkout/orders/{order_id}?"

          @path = @path.gsub("{order_id}", CGI::escape(order_id.to_s))
          @headers["Content-Type"] = "application/json"
        end
      end
    end
  end
end
