require_relative '../../test_harness'
require_relative './webhook_helper'

include PayPal::V1::Webhooks

describe WebhookListEventSubscriptionsRequest do
  it 'successfully makes a request' do
    create_resp = WebhookHelper::create_webhook
    request = WebhookListEventSubscriptionsRequest.new(create_resp.result.id)
    resp = TestHarness::client.execute(request)

    expect(resp.status_code).to eq(200)
    expect(resp.result).not_to be_nil
    expect(resp.result.event_types.count).to eq(2)
  end
end
