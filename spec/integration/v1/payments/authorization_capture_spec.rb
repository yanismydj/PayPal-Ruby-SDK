

require_relative '../../test_harness'
require_relative '../../../lib/lib'
require 'json'

include PayPal::V1::Payments

describe AuthorizationCaptureRequest do
  def build_request_body
    return JSON.parse('{"id":"3HHOFDH096JtA885WF1","invoice_number":"SBttcb8 WGMySsE7","is_final_capture":true,"links":{"href":"N3y7DBaE9WxL","method":"FSX2T30qWz","rel":"7q8MNbZqyy7w"},"reason_code":"puIYxidBLK3sZMuXIYq","state":"0ezqHgRFcRzN","transaction_fee":{"currency_code":"0tYZE376Ggw7tOdi3D","value":"g0atQe7Qxe0gAzB"},"amount":{"currency":"vW0saRJxz6x2dWH","details":{"insurance":"vzrXCuIKpcBg1XK9","shipping":"Zp3IYLPGO135hu24r34","shipping_discount":"Ax38p70FAI0ZLK","subtotal":"aaLigZZDV WH","tax":"tgpQVMUIaCg","gift_wrap":"eRtfDxhNC2g2B8","handling_fee":"Id2Ep8P9TyP"},"total":"3XIcp2dwRs3g3RsK7"},"create_time":"pPrQL8i1SDyVX","parent_payment":"0F6SUYJiq3UGX 2LZ","update_time":"LhTs Hi7 tuKd"}')
  end

  it 'successfully makes a request' do
    request = AuthorizationCaptureRequest.new("KVEAVq9ubfdrAac1")
    request.request_body(build_request_body)

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(201)
    expect(resp.result).not_to be_nil

    # Add your own checks here
  end
end
