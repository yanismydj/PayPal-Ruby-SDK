require_relative '../../test_harness'

include PayPal::V1::Invoices

module InvoiceHelper
  class << self

    def exec(req, body = nil)
      if body
        req.request_body(body)
      end


      resp = TestHarness::client.execute(req)
    end

    def create_invoice
      body = {
        "merchant_info": {
          "email": "team-dx-clients-facilitator@getbraintree.com",
          "first_name": "Dennis",
          "last_name": "Doctor",
          "business_name": "Medical Professionals, LLC",
          "phone": {
            "country_code": "001",
            "national_number": "5032141716"
          },
          "address": {
            "line1": "1234 Main St.",
            "city": "Portland",
            "state": "OR",
            "postal_code": "97217",
            "country_code": "US"
          }
        },
        "billing_info": [{
          "email": "example@example.com"
        }],
        "items": [{
          "name": "Sutures",
          "quantity": 100.0,
          "unit_price": {
            "currency": "USD",
            "value": 5
          }
        }],
        "note": "Medical Invoice 16 Jul, 2013 PST",
        "payment_term": {
          "term_type": "NET_45"
        },
        "shipping_info": {
          "first_name": "Sally",
          "last_name": "Patient",
          "business_name": "Not applicable",
          "phone": {
            "country_code": "001",
            "national_number": "5039871234"
          },
          "address": {
            "line1": "1234 Broad St.",
            "city": "Portland",
            "state": "OR",
            "postal_code": "97216",
            "country_code": "US"
          }
        },
        "tax_inclusive": false,
        "total_amount": {
          "currency": "USD",
          "value": "500.00"
        }
      }

      exec(InvoiceCreateRequest.new, body)
    end

    def get_invoice(id)
      exec(InvoiceGetRequest.new(id))
    end

    def send_invoice(id)
      req = InvoiceSendRequest.new(id)
      req.notify_merchant(true)

      exec(req)
    end

    def record_payment(id)
      send_invoice(id)

      request = InvoiceRecordPaymentRequest.new(id)
      request.request_body({
        :method => 'CASH',
        :date => '2017-07-11 00:01:00 PST',
        :amount => {
          :value => '10',
          :currency => 'USD'
        }
      })

      exec(request)
    end

    def record_refund(id)
      record_payment(id)

      req = InvoiceRecordRefundRequest.new(id)
      body = {
        :amount => {
          :value => '10',
          :currency => 'USD'
        }
      }

      exec(req, body)
    end

    def create_template
      body = {
        "name": "Hours Template_ruby#{Random.new.rand(1000000)}",
        "default": true,
        "unit_of_measure": "Hours",
        "template_data": {
          "items": [
            {
              "name": "Nutri Bullet",
              "quantity": 1,
              "unit_price": {
                "currency": "USD",
                "value": "50.00"
              }
            }
          ],
          "merchant_info": {
            "email": "team-dx-clients-facilitator@getbraintree.com",
          },
          "tax_calculated_after_discount": false,
          "tax_inclusive": false,
          "note": "Thank you for your business.",
          "logo_url": "https://pics.paypal.com/v1/images/redDot.jpeg",
          "allow_tip": true
        },
        "settings": [
          {
            "field_name": "items.date",
            "display_preference": {
              "hidden": true
            }
          },
          {
            "field_name": "custom",
            "display_preference": {
              "hidden": true
            }
          }
        ]
      }

      exec(TemplateCreateRequest.new, body)
    end

    def get_template(id)
      exec(TemplateGetRequest.new(id))
    end

    def delete_templates
      list_resp = exec(TemplateListRequest.new)

      puts "Deleting #{list_resp.result.templates.count} templates"

      list_resp.result.templates.each do |template|
        begin
          exec(TemplateDeleteRequest.new(template.template_id))
          puts "deleted #{template.template_id}"
        rescue Exception => e
          puts "Could not delete #{template.template_id}"
        end
      end
    end
  end
end
