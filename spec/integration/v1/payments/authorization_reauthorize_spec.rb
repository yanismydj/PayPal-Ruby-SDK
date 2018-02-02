

require_relative '../../test_harness'
require_relative '../../../lib/lib'
require 'json'

include PayPal::V1::Payments

describe AuthorizationReauthorizeRequest do
  def build_request_body
    return JSON.parse('{"amount":{"currency":"xa20aiUXN9fx","details":{"tax":"AcAtrxzTaa Qg","gift_wrap":" Sv54Ue7 Is7","handling_fee":"9TqT3fzhQJQ5","insurance":"TiJ R44XqN38O19G","shipping":"PgLq1rE8R9BL 987","shipping_discount":"5wZ3Ded65Wshd2DU","subtotal":"Ae88cwOs4A0w"},"total":"sS41 vscwLK"},"parent_payment":"6q3MbTcBhT0zI","protection_eligibility":"UdI6bdXNeD8TJuKia0","receipt_id":"q0vqAvdVFQhwNOXDd","pending_reason":"bb4sIAAbWcf38","valid_until":"yi0rPJKs7dCfih0Qg","fmf_details":{"description":"sfyKuOV 81z1QVx yyf","filter_id":"gJMY5BELLw","filter_type":"4CetgLHMrFS6cswEa","name":"DOz3cUpB1idW3z2"},"id":"GdSabNDzZrOvwMEEb6","links":{"href":"bEAeXt555w1SZTvU","method":"5ZYfvHaKzG4aXvpg","rel":"0EFdSaVOthg0BVDWpFx"},"payment_mode":"U3qHW9ScP19","update_time":"c cA2VF3evcD","reference_id":"Fui0Ridd4N","state":"CHJp6p6awDTAUfch","create_time":"OiUGi7LfxKRd0KzBBAT","processor_response":{"avs_code":"UWzZdZWCrxQwZp2P6M9","cvv_code":"qAJ47f7SFyTatWCXz9","eci_submitted":"BQqUqF1Rtz3dRh3K","response_code":"YTcaUpKTJwqtXS92","vpas":"Y32sqMOMCiP7","advice_code":"73JArY9FN4"},"protection_eligibility_type":"2JrvB2 x3DJ","reason_code":"Xa9Jz2RraW9Ttv3fre"}')
  end

  it 'successfully makes a request' do
    request = AuthorizationReauthorizeRequest.new("sxeQCGZxCvKJDN1aN8")
    request.request_body(build_request_body)

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(201)
    expect(resp.result).not_to be_nil

    # Add your own checks here
  end
end
