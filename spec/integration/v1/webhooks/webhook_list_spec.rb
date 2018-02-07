require_relative '../../test_harness'
require_relative './webhook_helper'

include PayPal::V1::Webhooks

describe WebhookListRequest do
  it 'successfully makes a request' do
    create_resp = WebhookHelper::create_webhook
    list_resp = TestHarness::exec(WebhookListRequest.new)

    expect(list_resp.status_code).to eq(200)
    expect(list_resp.result).not_to be_nil
    expect(list_resp.result.webhooks.count).to eq(1)
  end
end
