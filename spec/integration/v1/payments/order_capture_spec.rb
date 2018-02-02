

require_relative '../../test_harness'
require_relative '../../../lib/lib'
require 'json'

include PayPal::V1::Payments

describe OrderCaptureRequest do
  def build_request_body
    return JSON.parse('{"parent_payment":"OfQIUM3UebMp3Zx","state":"ycGvYCY1T9DR","update_time":"eGV 5Gc6O1ci9eJdRc","amount":{"total":"FJM9HqqKi6zDv2hcUW","currency":"JwcrNIA8vY2YJEJ w0I","details":{"subtotal":"sgLh11cCGC22qUs","tax":"Eppxd32WZbYeNNDY","gift_wrap":"axh1uyr8Z20L5","handling_fee":"9ar hqxqt3fVf2Ys6V","insurance":"yxVeEKPX3z579v3Ys6F","shipping":" g8eAsR903","shipping_discount":"Y d5y8EQhX"}},"create_time":"8Mr1DuqBYPsOw","id":"xPPV4K42GzON7x 5aP7","is_final_capture":true,"links":{"method":" h0T z9zP ","rel":"hJdsZ8ERRsg8f3zcq3H","href":"dzIypGWXd5yJhBU"},"invoice_number":"EQ1FZHccH9","reason_code":"9Y3IyvT2OiOO2gWOz","transaction_fee":{"currency_code":"h7igatE5QXG8yJ ","value":"COt4EffWXxCG8sJ"}}')
  end

  it 'successfully makes a request' do
    request = OrderCaptureRequest.new("f6iYVU76VAasve8dSQD")
    request.request_body(build_request_body)

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(201)
    expect(resp.result).not_to be_nil

    # Add your own checks here
  end
end
