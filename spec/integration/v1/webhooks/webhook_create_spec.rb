require_relative '../../test_harness'
require_relative './webhook_helper'

include PayPal::V1::Webhooks

describe WebhookCreateRequest do
  it 'successfully makes a request' do
    resp = WebhookHelper::create_webhook
    expect(resp.status_code).to eq(201)
    expect(resp.result).not_to be_nil
  end
end
