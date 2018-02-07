require_relative '../../test_harness'
require_relative './vault_helper'
require 'json'

include PayPal::V1::Vault

describe CreditCardCreateRequest do
  it 'successfully makes a request' do
    resp = VaultHelper::create_card

    expect(resp.status_code).to eq(201)
    expect(resp.result).not_to be_nil

    expect(resp.result.type).to eq('visa')
  end
end
