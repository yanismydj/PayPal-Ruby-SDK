require_relative '../../test_harness'
require 'uri'
require 'cgi'

include PayPal::V1::Identity

describe UserinfoGetRequest do

  it 'builds user consent url' do
    builder = UserConsent.new(TestHarness::environment)
    builder.response_type('code')
    builder.scope('profile+email+openid+address')
    builder.redirect_uri('http://example.com')
    builder.state('some-state')
    builder.nonce('some-nonce')

    url = builder.build

    parsed = URI(url)

    expect(parsed.scheme).to eq('https')
    expect(parsed.host).to eq('sandbox.paypal.com')
    expect(parsed.path).to eq('/signin/authorize')

    query = CGI::parse(parsed.query)
    expect(query['response_type'][0]).to eq('code')
    expect(query['scope'][0]).to eq('profile email openid address')
    expect(query['redirect_uri'][0]).to eq('http://example.com')
    expect(query['state'][0]).to eq('some-state')
    expect(query['nonce'][0]).to eq('some-nonce')
  end

  it 'gets refresh token from code', :skip => 'This test is an example of how to obtain user consent' do
    builder = UserConsent.new(TestHarness::environment)
    builder.redirect_uri(CGI::escape('http://requestbin.fullcontact.com/15a7bhu1'))
    builder.response_type('code')
    builder.scope('profile+email+openid+address')

    url = builder.build

    # Fetched from visiting the `url` and signing in w/ PayPal account
    code = 'C21AAHkGGpGk-g8ZbMuKwTtisc6mkv18Tplrvu9RZR-_zmNQS0xthson09WpKA8vYi4G7ESo3fu694FXm3sxVRclBwg24b1MA'

    environment = TestHarness::environment
    refresh_token_request = PayPal::RefreshTokenRequest.new(environment, code)
    token_response = TestHarness::exec(refresh_token_request)

    expect(token_response.status_code).to eq(200)
    expect(token_response.result).not_to be_nil
  end

  it 'gets user info' do
    # Fetched using the above example
    refresh_token = 'R23AAEWf7GghkOpcrCXhiDkS2IpGPR-r_jMIez_gcTzrstXCsro0ZC2P8xEnv5lm4A8h2QXFhMhIcKI8Ak5lP8kIyZzCxqjg_JbX8QI7KJoXrbn57U19_tlfs-Z-seXHtK74OeGhJyGxfRTBLbOIw'

    scoped_http_client = PayPal::PayPalHttpClient.new(TestHarness::environment, refresh_token)

    request = UserinfoGetRequest.new()
    request.schema('openid')

    resp = scoped_http_client.execute(request)
    expect(resp.status_code).to eq(200)
    expect(resp.result).not_to be_nil
  end
end
