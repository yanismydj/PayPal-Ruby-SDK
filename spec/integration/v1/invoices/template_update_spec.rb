require_relative '../../test_harness'
require_relative './invoice_helper'

include PayPal::V1::Invoices

describe TemplateUpdateRequest do
  it 'successfully makes a request' do
    create_response = InvoiceHelper::create_template

    template = create_response.result
    request = TemplateUpdateRequest.new(template.template_id)

    body = {
      "name": "Hours Template_ruby#{Random.new.rand(1000000)}",
      "default": true,
      "unit_of_measure": "Hours",
      "template_data": {
        "items": [
          {
            "name": "Nutri Bullet 3000",
            "quantity": 1,
            "unit_price": {
              "currency": "USD",
              "value": "50.00",
            },
          },
        ],
        "merchant_info": {
          "email": "team-dx-clients-facilitator@getbraintree.com",
        },
        "tax_calculated_after_discount": false,
        "tax_inclusive": false,
        "note": "Thank you for your business.",
        "logo_url": "https://pics.paypal.com/v1/images/redDot.jpeg",
        "allow_tip": true,
      },
      "settings": [
        {
          "field_name": "items.date",
          "display_preference": {
            "hidden": true,
          },
        },
        {
          "field_name": "custom",
          "display_preference": {
            "hidden": true,
          },
        },
      ],
    }

    request.request_body(body)

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(200)
    expect(resp.result).not_to be_nil

    get_response = InvoiceHelper::get_template(resp.result.template_id)
    expect(get_response.result.template_data.items[0].name).to eq('Nutri Bullet 3000')
  end
end
