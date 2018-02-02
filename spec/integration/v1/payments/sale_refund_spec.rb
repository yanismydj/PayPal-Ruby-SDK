

require_relative '../../test_harness'
require_relative '../../../lib/lib'
require 'json'

include PayPal::V1::Payments

describe SaleRefundRequest do
  def build_request_body
    return JSON.parse('{"amount":{"total":"h5B 7Ar IgGO7A2A","currency":"sEWAPNV84bAYKV","details":{"handling_fee":"KKzAyD9sFHHV","insurance":"Q7dIAWqvWBZP7","shipping":"TqYf7arEvseR","shipping_discount":"F421gew1ae fb7wIR","subtotal":"i9Buew3eBKxi","tax":"iCzNJiyGDtaC6","gift_wrap":"8F677c4sEHi4it"}},"description":"C2XCwpDM3wWvKfrL","invoice_number":"BcHY49eXUEviCQXEK","reason":"UNrcEI6Gt6y5RTS"}')
  end

  it 'successfully makes a request' do
    request = SaleRefundRequest.new("E2dH660J9iEfah")
    request.request_body(build_request_body)

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(201)
    expect(resp.result).not_to be_nil

    # Add your own checks here
  end
end
