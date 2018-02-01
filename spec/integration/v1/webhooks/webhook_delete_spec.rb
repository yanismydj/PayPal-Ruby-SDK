require_relative '../../test_harness'
require_relative './webhook_helper'

include PayPal::V1::Webhooks

describe WebhookDeleteRequest do
  it 'successfully makes a request' do
    create_resp = WebhookHelper::create_webhook

    resp = WebhookHelper::delete_webhook(create_resp.result.id)
    expect(resp.status_code).to eq(204)
  end
end
