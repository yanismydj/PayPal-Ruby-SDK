require_relative '../../test_harness'
require_relative './vault_helper'
require 'json'

include PayPal::V1::Vault

describe CreditCardUpdateRequest do
  it 'successfully makes a request' do
    create_resp = VaultHelper::create_card

    request = CreditCardUpdateRequest.new(create_resp.result.id)
    request.request_body([{
      :op => 'add',
      :path => '/billing_address/line1',
      :value => '53 N Main st'
    }])

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(200)
    expect(resp.result).not_to be_nil

    get_resp = TestHarness::exec(CreditCardGetRequest.new(create_resp.result.id))

    expect(get_resp.result.billing_address.line1).to eq('53 N Main st')
  end
end
