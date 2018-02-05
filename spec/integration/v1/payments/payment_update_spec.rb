require_relative '../../test_harness'
require_relative './payments_helper'

include PayPal::V1::Payments

describe PaymentUpdateRequest do
  it 'successfully makes a request' do
    create_response = PaymentsHelper::create_payment('sale', payment_method='paypal')

    request = PaymentUpdateRequest.new(create_response.result.id)
    request.request_body([{
      :path => '/transactions/0/amount',
      :op => 'replace',
      :value => {
        :currency => 'USD',
        :total => '11'
      }
    }])

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(200)
    expect(resp.result).not_to be_nil

    get_response = TestHarness::exec(PaymentGetRequest.new(create_response.result.id))

    expect(get_response.result.transactions[0].amount.total).to eq('11.00')
  end
end
