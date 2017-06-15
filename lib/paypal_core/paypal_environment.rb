require "braintreehttp"
require "base64"

module PayPalCore
  
  SANDBOX = 'https://api.sandbox.paypal.com';
  LIVE = 'https://api.paypal.com';
  
  class PayPalEnvironment < BraintreeHttp::Environment
    
    attr_accessor :client_id, :client_secret
    
    def initialize(client_id, client_secret, base_url)
      super(base_url)
      @client_id = client_id
      @client_secret = client_secret
    end
    
    def authorizationString() 
      encoded = Base64.strict_encode64("#{@client_id}:#{@client_secret}")
      return "Basic #{encoded}"
    end
  end
  
  class SandboxEnvironment < PayPalCore::PayPalEnvironment
    def initialize(client_id, client_secret)
      super(client_id, client_secret, PayPalCore::SANDBOX)
    end
  end
  
  class LiveEnvironment < PayPalCore::PayPalEnvironment
    def initialize(client_id, client_secret)
      super(client_id, client_secret, PayPalCore::LIVE)
    end
  end
end

