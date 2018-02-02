

require_relative '../../test_harness'
require_relative '../../../lib/lib'
require 'json'

include PayPal::V1::Payments

describe CaptureRefundRequest do
  def build_request_body
    return JSON.parse('{"invoice_number":"F3RH9iIwe8  z2h92u","reason":"qvuUZSJfJ6X","amount":{"details":{"shipping":"qW8QiruyKEpK3KQEqt","shipping_discount":"EAy1TFvx7zzhGiAQRe","subtotal":"cs9cONZuHwGHr","tax":"HY6efAC8NLG2","gift_wrap":"z2QX29fDx2TdMT2CW","handling_fee":"DwY3geZXeGOJ46NGXIx","insurance":"ZdWRyTPgG2 7XvA3"},"total":"DHg5q9pSIEGZ4PJ9","currency":"WaefXvYwwEbSbOarU"},"description":"Za7TE93IPD3QEiYvN0P"}')
  end

  it 'successfully makes a request' do
    request = CaptureRefundRequest.new("A0yHSrYhuO8q")
    request.request_body(build_request_body)

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(200)
    expect(resp.result).not_to be_nil

    # Add your own checks here
  end
end
