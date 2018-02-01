require_relative '../../test_harness'
require_relative './vault_helper'

include PayPal::V1::Vault

describe CreditCardListRequest do
  it 'successfully makes a request' do
    VaultHelper::create_card

    request = CreditCardListRequest.new()

    resp = TestHarness::client.execute(request)

    expect(resp.status_code).to eq(200)
    expect(resp.result).not_to be_nil
    expect(resp.result.items.count > 0).to be(true)
  end
end
