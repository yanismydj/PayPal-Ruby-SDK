require_relative '../../test_harness'
require_relative './payments_helper'

include PayPal::V1::Payments

describe PaymentCreateRequest do
  it 'successfully makes a request' do
    create_response = PaymentsHelper::create_payment('sale')

    expect(create_response.status_code).to eq(201)
    expect(create_response.result).not_to be_nil
  end
end
