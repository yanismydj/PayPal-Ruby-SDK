require "braintreehttp"

module PayPalCore
  
  class PayPalHttpClient < BraintreeHttp::HttpClient
    
    attr_accessor :refresh_token
    
    def initialize(environment, refresh_token=nil)
      super(environment)
      @refresh_token = refresh_token

      self.add_injector(PayPalHttpClient::PayPalHeadersInjector.new)
      self.add_injector(PayPalHttpClient::PayPalAuthInjector.new(self))
    end
    
    def parse_response_body(body, headers)
      if headers["content-type"].include? "application/json"
        return OpenStruct.new(JSON.parse(body))
      end

      body
    end

  end
  
  class PayPalHeadersInjector < BraintreeHttp::Injector
    def inject(request)
      request["Accept-Encoding"] = "gzip"
    end
  end
  
  class PayPalAuthInjector < BraintreeHttp::Injector
    
    attr_accessor :http_client, :access_token
    
    def initialize(http_client)
      @http_client = http_client
    end
    
    def inject(request)
      if (request.instance_of? PayPalCore::PayPalAccessTokenRequest)
        return
      end
      
      if (!self.access_token || !self.access_token.is_expired)
        accessTokenRequest = PayPalCore::PayPalAccessTokenRequest.new(@http_client.environment, @http_client.refresh_token)
         tokenResponse = self.http_client.execute(accessTokenRequest)
         @access_token = PayPalCore::PayPalAccessToken.new(tokenResponse.result)
      end
      request["Authorization"] = @access_token.authorizationString()
    end
  end
  
end
