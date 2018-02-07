# This class was generated on Thu, 01 Feb 2018 12:44:50 PST by version 0.1.0-dev+3a517e of Braintree SDK Generator
# invoice_delete_external_refund_request.rb
# @version 0.1.0-dev+3a517e
# @type request
# @data H4sIAAAAAAAC/6yST2/TQBDF73yK1ZyXOnD0DTVBrfgXIOKCqmjqfakXObtmdlxqRfnuaLOGJs0BIfVm/fQ8fr8Z7+gjb0E1+XAffYMLhw6KNR4UErhbCzZDcGRpjtSI79XHQDXND7FkOJg/UVOi1tyOZppmrueGgzMqHBI3+V1zPb8gS58HyLhk4S0Ukqj+fmPpCuwgT+nbKNunbMnanrAdrcY+eyQVH+7I0jcWz7cdTv3WPru8wzjhM7FVe2gdN0Zb/PXYSNyaX61vWqPRlB0dAsX5WDDbvRHhsRSaWfoCdp9CN1K94S4hg5+DFziqVQZYWkrsIeqRqA5D1+3tP3WOPvifSueNH5Weo/tNySBpGZJhRqmPIeGYXcagCFOMuO8733AuVP1IMZClK9X+A7SNLv9xi/eL1YLK7amm6v5VVc7jw930hFTtHg+9r4rrS0ETxaVqd7q1PVlaPPRoFO6rsg7pMjpQ/Xo227/4DQAA//8=
# DO NOT EDIT
require 'cgi'

module PayPal
  module V1
    module Invoices

      #
      # Deletes an external refund, by invoice ID and transaction ID.
      #
      class InvoiceDeleteExternalRefundRequest
        attr_accessor :path, :body, :headers, :verb

        def initialize(invoice_id, transaction_id)
          @headers = {}
          @body = nil
          @verb = "DELETE"
          @path = "/v1/invoicing/invoices/{invoice_id}/refund-records/{transaction_id}?"

          @path = @path.gsub("{invoice_id}", CGI::escape(invoice_id.to_s))

          @path = @path.gsub("{transaction_id}", CGI::escape(transaction_id.to_s))
          @headers["Content-Type"] = "application/json"
        end
      end
    end
  end
end
