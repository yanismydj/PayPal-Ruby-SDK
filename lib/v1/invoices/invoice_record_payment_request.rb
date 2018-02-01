# This class was generated on Thu, 01 Feb 2018 12:44:50 PST by version 0.1.0-dev+3a517e of Braintree SDK Generator
# invoice_record_payment_request.rb
# @version 0.1.0-dev+3a517e
# @type request
# @data H4sIAAAAAAAC/7xWX08ctxd9/32KK+cFVsMOCb+26r5RIAptgW1AVSuEkrv2HcbBYzv2HegU8d0rz8zOMrtBaRXE2+rMtfecc//43otTrEjMhLa3TkuaBpIuqB2PTUWWRSYOKcqgPWtnxUycYLiJwCVBZOQ6gisALfSnM1g0cHyYAUbwqNUUjq00tSJA6G8ERYzagFt8IsnAJSao0Ja6a5dhFXHpFKBV4Lik0J+LoG0b9/P52SkE+lxTZFg41UxFJn6rKTRzDFgRU4hidnmViXeEisI6+taFah2bI5cj7F5cND65Ezloey0y8TsGjQtDY9c+aCUy8Qs1Pbxh20VJcHyYzErc+1PADioMN4NbIhP7IWDT/eluJt4TqjNrGjEr0ERKwOdaB1JixqGmTMyD8xRYUxQzWxvzcNXFUOTukkHBvPf1sLVxU0mycKShB8Y65qMkxv/EuAceU14ZfFCHQFY2m8SwcnVbiCtqAzQm9xNGWtZV4QKgMVBoi1ZqNHCLpiYIZJBJQaHJqAhbCzRoU+EO5VlTBsRyuv1s2p4qHtlrPnCKRvrkyoyxwj0wxEwBlhEgXWqu2LeQavvv/Az+/+b1D9+anLaesq+qaH0d0V8iY+5d0qD2qexPQelrzYBFUpN6QpHUFZoIkTwG5JS/lSxtB1ltatMJ9D44HzQyjf14lj76F8oV8lh4D2y2fvoAdyXZUfvfDVNyiClcqJBBR5g0TdNMdiYnJ5OdiVITmPw9ydYsuTy2TMESwyEy5Re6Injb3nC1VTL7WZ6zcyZONXExdeE6L7kyeSjk3t7ej68iycRx57vp99svVCzdVB+ZNkCbtg1vQSpyF/o3YQpLJnCnuWwt/Xj0x8XR+9P9Xz8Oh7jxz1IJXxdl3Vod9MBY0Fn7A80U9iEFAMbopG6n0aCjJ/9C2eCANmJbBOsv2ManL75n7ZSFOTZzNCvjV0e/mKr5/p/zb0rU8whOf/uk5P7jpuhHQS9KfIPsUwQfu5pmxLCcaXsNhXF33bS57PY8CFTUVl1t5crJmKPX+RCdv+oHVfzQL4Vd8PZyN4u19y5wXO/ALqyzp/2zIeWPvqQZ11+QnmMXYIHy5g6DAukqj6wX2mhunsXgq4cUFb2zkbp7EpyJA2eZbL8qCfTeaInJzPxTdFZk4h2zP+kG1EzMz84vRLclipnIb18/8mppVX6/Wgkf8o1l+ugvT5JJnbfLc/vwz97s7j787x8AAAD//w==
# DO NOT EDIT
require 'cgi'

module PayPal
  module V1
    module Invoices

      #
      # Marks the status of an invoice, by ID, as paid. Include a payment detail object that defines the payment method and other details in the JSON request body.
      #
      class InvoiceRecordPaymentRequest
        attr_accessor :path, :body, :headers, :verb

        def initialize(invoice_id)
          @headers = {}
          @body = nil
          @verb = "POST"
          @path = "/v1/invoicing/invoices/{invoice_id}/record-payment?"

          @path = @path.gsub("{invoice_id}", CGI::escape(invoice_id.to_s))
          @headers["Content-Type"] = "application/json"
        end

        def request_body(body)
          @body = body
        end
      end
    end
  end
end
