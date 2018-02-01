# This class was generated on Wed, 31 Jan 2018 15:11:24 PST by version 0.1.0-dev+6a771d-dirty of Braintree SDK Generator
# invoice_delete_external_payment_request.rb
# @version 0.1.0-dev+6a771d-dirty
# @type request
# @data H4sIAAAAAAAC/6yST2/TQBDF73yK1ZyXOnD0DTVBrfgXIOKCqmjqfakX2bvL7LjUivLd0dYuTQoSQuJm/fQ8fr8Z7+k996CafLiNvsGZQwfFFncKCdxtE489gpKlJXIjPqmPgWpa3uey4WAesmbOWnM9mnmeuVwaDs6ocMjclJfN5fKMLH0cIOOahXsoJFP99crSBdhBntLXUfqnbM3anrA9bcZUTLKKDzdk6QuL5+sOp4Zb78jSG4wz/s1s0963jjujLX557CT25kfrm9ZoNNOWDD8oH/sVuVciPE59FpY+gd2H0I1U77jLKOD74AWOapUBltYSE0Q9MtVh6LqD/avN0Qf/0egPlR+V/kf5qymDrNOQAgvKKYaMY3YegyLMMeKUOt9wKVR9yzGQpQvV9A7aRld+udXb1WZF0+2ppur2RTWdx4eb+Qm52j8e+lDNss8FTRSXq/3p3g5kaXWX0CjcZ2Ud8nl0oPrlYnF49hMAAP//
# DO NOT EDIT

require 'uri'

module PayPal
  module V1
    module Invoices

      #
      # Deletes an external payment, by invoice ID and transaction ID.
      #
      class InvoiceDeleteExternalPaymentRequest
        attr_accessor :path, :body, :headers, :verb

        def initialize(invoice_id, transaction_id)
          @headers = {}
          @body = nil
          @verb = "DELETE"
          @path = "/v1/invoicing/invoices/{invoice_id}/payment-records/{transaction_id}?"

          @path = @path.gsub("{invoice_id}", URI.escape(invoice_id.to_s))

          @path = @path.gsub("{transaction_id}", URI.escape(transaction_id.to_s))
          @headers["Content-Type"] = "application/json"
        end
      end
    end
  end
end
