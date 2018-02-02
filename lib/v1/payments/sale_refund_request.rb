# This class was generated on Thu, 01 Feb 2018 12:44:56 PST by version 0.1.0-dev+3a517e of Braintree SDK Generator
# sale_refund_request.rb
# @version 0.1.0-dev+3a517e
# @type request
# @data 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
# DO NOT EDIT
require 'cgi'

module PayPal
  module V1
    module Payments

      #
      # Refunds a sale, by ID. For a full refund, include an empty payload in the JSON request body. For a partial refund, include an `amount` object in the JSON request body.
      #
      class SaleRefundRequest
        attr_accessor :path, :body, :headers, :verb

        def initialize(sale_id)
          @headers = {}
          @body = nil
          @verb = "POST"
          @path = "/v1/payments/sale/{sale_id}/refund?"

          @path = @path.gsub("{sale_id}", CGI::escape(sale_id.to_s))
          @headers["Content-Type"] = "application/json"
        end

        def request_body(refundRequest)
          @body = refundRequest
        end
      end
    end
  end
end
