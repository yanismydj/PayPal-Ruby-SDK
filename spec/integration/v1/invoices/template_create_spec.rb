require_relative '../../test_harness'
require_relative './invoice_helper'

include PayPal::V1::Invoices

describe TemplateCreateRequest do
  it 'successfully makes a request' do
    create_response = InvoiceHelper::create_template

    expect(create_response.status_code).to eq(201)
    expect(create_response.result).not_to be_nil
    expect(create_response.result.unit_of_measure).to eq('HOURS')
  end
end
