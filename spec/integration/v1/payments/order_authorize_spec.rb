

require_relative '../../test_harness'
require_relative '../../../lib/lib'
require 'json'

include PayPal::V1::Payments

describe OrderAuthorizeRequest do
  def build_request_body
    return JSON.parse('{"reference_id":"ZWx4hrw816sh","fmf_details":{"filter_type":"DHESUGSxARXR","name":"uB5If23f1OGQMWs128T","description":"ySx0F9Nx 9UEqWq","filter_id":"hZgRvVsJrQQuY2QMa"},"links":{"href":"2LXYtLIsE qM SWz3L","method":"2pLWyJ4h OEhN552007","rel":"MpgM5KRya5v"},"reason_code":"AX2g6iuVPffeIa","amount":{"currency":"egh9HvCfpzJySyWLaqR","details":{"shipping_discount":"X4ZDPvPgsvJ EwMYX","subtotal":"4YJrvNTgSeW0vD","tax":"W MP2Q3Pz2","gift_wrap":"B8gOcU4BZsx 5i3","handling_fee":"P8XZszUhHgstqEqcO","insurance":"cdAL3Id0bY0TWrJyfF","shipping":"2zZaUDSsb254S"},"total":"hsODNI6szgvV0CXcvp"},"parent_payment":"3vZIzN8hNCOhtJV057v","pending_reason":"fqBhpHpVISb60","protection_eligibility_type":"35A5JNfCCJ","update_time":"bC11az74tDZiF","protection_eligibility":"WJUdYMByWJFQ1tK","state":"gStuJLXGFK3M9F","create_time":"46Q1fwVdDO","id":"d9hrQ0iHDNEBrHR","payment_mode":"WXy17fL9tF3sGc1pSbv"}')
  end

  it 'successfully makes a request' do
    request = OrderAuthorizeRequest.new("EsHH6xVA hxJYr")
    request.request_body(build_request_body)

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(201)
    expect(resp.result).not_to be_nil

    # Add your own checks here
  end
end
