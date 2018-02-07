# This class was generated on Thu, 01 Feb 2018 12:44:50 PST by version 0.1.0-dev+3a517e of Braintree SDK Generator
# invoice_cancel_request.rb
# @version 0.1.0-dev+3a517e
# @type request
# @data H4sIAAAAAAAC/7xWQW/zNgy971cQOgtJtgE7+FakG75s+JJsKXbZikCRmFqdLLoS3c4o8t8HWU4aOy2KotsuQfJEk++Rz1SexVJVKAph/SNZjROtvEYnpLjGqIOt2ZIXhZh3cAQFET1DHy1h18LiWoLyRgJ1wcq5VqYok6I9sd1brdIJqB01DFwi5Couw0wdVqsWg4QKgy6V5y4pzHUBWCnr4kRI8WuDoV2roCpkDFEUf9xK8QWVwTBGf6JQjbG14nKAPYubtk7qIwfr74QUv6tg1c7hsCtba4QUv2DbwxftuSkRFtdA+05J/1QSloUm7lchqDaXm0nxGyqz8q4VxV65iAl4aGxAIwoODUqxDlRjYItRFL5x7nCbYzByTnLinkcDy7NOXwrZkWkHEnrgjSn73HSgAJuvm8EUP6SlB87FvN90rbd55APC5+iQ9ZUHlQil9pPHRLqigDCfn7wDiz201ABVNhnQRqiPPoB9oKob28+b1RJC7jGk/sixgW3M9mcC5dxLAVDGBIwRI3CpGFRIdg48MsQEVlxieLIRJcQatd23YzZM4GxmiZfJCZ5Kq8s3eE3+bGaz7/XOkf7roSHG7nf+1JED+buMLImxyPD0HIcrY2x+iS9qJ02eGGJT1xQYTV9tOi439McPH/VHZ3b5rkk8MQ780QMjayTKONgwn/XviN+OyKF65Y1LG3DLtD3uswHZVw6HxBfepOFihKcSk2mShvRUJ2Qw/F7cMdX/ra9r6qvijiefVfZfjO0tW8Vmd496NKwTdrn0+7Pji/5vLsq89Q8pKtbkI+Y8CZZiTp7R91eBUHXt+qrT+9jt/y/M9VfkkowoxHq1uRH5/hOFmD5+O80byfq7/hvG6fPLZXeYnv4G/Ph3jZrRbFhxE+dkUBTfzWaHb/4BAAD//w==
# DO NOT EDIT
require 'cgi'

module PayPal
  module V1
    module Invoices

      #
      # Cancels a sent invoice, by ID, and, optionally, sends a notification about the cancellation to the payer, merchant, and Cc: emails.
      #
      class InvoiceCancelRequest
        attr_accessor :path, :body, :headers, :verb

        def initialize(invoice_id)
          @headers = {}
          @body = nil
          @verb = "POST"
          @path = "/v1/invoicing/invoices/{invoice_id}/cancel?"

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
