require_relative '../../test_harness'
require_relative './webhook_helper'

include PayPal::V1::Webhooks

describe WebhookUpdateRequest do
  def build_request_body
    return JSON.parse('{"from":"JTZh8uy7C 4idz4I","op":"hFua8SzJ27wJPh1KUgw","path":"xPyhuQ0fuQzyeKz","value":{}}')
  end

  it 'successfully makes a request' do
    create_resp = WebhookHelper::create_webhook

    url = 'https://example.com/new'
    request = WebhookUpdateRequest.new(create_resp.result.id)
    request.request_body([{
      :op => 'replace',
      :path => '/url',
      :value => url
    }])

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(200)
    expect(resp.result).not_to be_nil

    get_resp = TestHarness::exec(WebhookGetRequest.new(create_resp.result.id))
    expect(get_resp.result.url).to eq('https://example.com/new')
  end
end
