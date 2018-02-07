require_relative '../../test_harness'
require_relative './vault_helper'

include PayPal::V1::Vault

describe CreditCardGetRequest do
  it 'successfully makes a request' do
    create_resp = VaultHelper::create_card
    request = CreditCardGetRequest.new(create_resp.result.id)

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(200)
    expect(resp.result).not_to be_nil

    expect(resp.result.id).to eq(create_resp.result.id)
  end
end
