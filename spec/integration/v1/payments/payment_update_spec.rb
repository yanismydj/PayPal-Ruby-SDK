

require_relative '../../test_harness'
require_relative '../../../lib/lib'
require 'json'

include PayPal::V1::Payments

describe PaymentUpdateRequest do
  def build_request_body
    return JSON.parse('{"from":"5wNCWeR y9AhSr1FfZ","op":"5WpVhtz2b uHbDd2Q","path":"4f8yGH3cU6f","value":{}}')
  end

  it 'successfully makes a request' do
    request = PaymentUpdateRequest.new("LB2 fSiWs8s7x")
    request.request_body(build_request_body)

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(200)
    expect(resp.result).not_to be_nil

    # Add your own checks here
  end
end
