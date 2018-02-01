require_relative '../../test_harness'
require_relative './vault_helper'
require 'json'

include PayPal::V1::Vault

describe CreditCardDeleteRequest do
  it 'successfully makes a request' do
    create_resp = VaultHelper::create_card

    request = CreditCardDeleteRequest.new(create_resp.result.id)

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(204)
  end
end
