

require_relative '../../test_harness'
require_relative '../../../lib/lib'
require 'json'

include PayPal::V1::Payments

describe PaymentExecuteRequest do
  def build_request_body
    return JSON.parse('{"payer_id":"u92hb7hJRTxq","transactions":{"payee":{"payee_display_metadata":{"brand_name":"DCM1qg XaQ","display_phone":{"number":"6ZqN ee8ZXpP9","country_code":"YJsBPeCWLg26Jt"},"email":"a5DWug4eTw1dMx6i1V"},"email":"zUcB8VCvyptzy","merchant_id":"SZR8Q2hqTyGJTY"},"purchase_order":"6FufVqC2xFKcZLZ7dyh","amount":{"details":{"gift_wrap":"uxihDL3wsyZBXDwtW4","handling_fee":"WX82QM54A1SgWhv","insurance":"48iN8Q5C2XJfvQI1D","shipping":"Wuc1gZGED9","shipping_discount":"XDZDO7FIGxWAZHFMC","subtotal":"MF1IL3xd6YW","tax":"3I4VT8XOrrTxI"},"total":"ZWeSJ5X1rBxvvBgEsuU","currency":"fxIuHrGIq4"},"custom":" g d7peMevfAeTW2","invoice_number":"GvCHLtsw 8","item_list":{"items":{"url":"CfxSAAxJGPsEO5dTp","currency":"tKUwwxYXI9Ps1MtpbQ","description":"YLYPEJgKhVwzYT","name":"KFb0PIxP2MfdQ","price":"8DJ2iSNFt26RLUHvv","quantity":"upY5z CvtII9c","sku":"q54xacK1fdBCsagbW1f","tax":"3vKQKh3vx3OPTVCew09"},"shipping_address":{"country_code":"GOa95VcSCRJ1RBQGYg","line1":"JMOesTy2SDWbK","normalization_status":"HQ8zhyOR4OtKB W","postal_code":"ivFpKXZEDhQH","recipient_name":"aOcPUYQfKHNd0zD","city":"7tzHREBIat ETiB","line2":"YI0LxuRWVefB","phone":"y4RNuPhtc1f","state":"b39321ZLGF9B","status":"wppNKTS1Vvr","type":" ssN7XLELZLu"},"shipping_method":"szE02SWuCz7","shipping_phone_number":"U442t4iJW48yhpqNLbg"},"notify_url":"DSO8QBx8NBPzYYaI","order_url":"GV2PTS7Y05fdV","description":"I0PHM7wMWtpf","note_to_payee":"8BFCcgDw2LpHcWDZhT","payment_options":{"allowed_payment_method":"OYT1fJQKANf7etYcVQW"},"reference_id":"tRW36NstPfeHHgSI A9","soft_descriptor":"swCzydN2BaLXJJy"}}')
  end

  it 'successfully makes a request' do
    request = PaymentExecuteRequest.new("MH3RFBvcAz6b")
    request.request_body(build_request_body)

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(200)
    expect(resp.result).not_to be_nil

    # Add your own checks here
  end
end
