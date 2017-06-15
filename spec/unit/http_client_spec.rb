require 'net/http'
require 'ostruct'

describe PayPalCore::PayPalEnvironment do

  before do
    WebMock.disable!
    @environment = PayPalCore::SandboxEnvironment.new('AXbzg5nWq0LLk8KaprqGLlqXdtCjCiwV0P5o_qJYoBqfMbjwXjLVEleXCgKHjZ_BewvmNMV-5sOiBLxq', 'EHz_gvWkcR8_FwgUsHBZiXZCmFxuRMN3oecWwHTxRJiFzDk56rUH1rzg7Sdv3fzoE9FLS_uJSkAOjjGi')
  end

  it "uses injectors to modify request" do
    
    httpClient = PayPalCore::PayPalHttpClient.new(@environment)
    
    req = Net::HTTP::Get.new("/v1/notifications/webhooks-event-types?")
    req['Content-Type'] = 'application/json'

    resp = httpClient.execute(req)
    puts resp.result.event_types.inspect
  end
end

