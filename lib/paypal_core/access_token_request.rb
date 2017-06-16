module PayPalCore
  
  class PayPalAccessTokenRequest
    
    attr_accessor :path, :body, :headers, :verb
    
    def initialize(environment, refreshToken=nil)
      @path = "/v1/oauth2/token"
      @body = "grant_type=client_credentials"

      if (refreshToken)
        @path = "/v1/identity/openidconnect/tokenservice"
        @body += "refresh_token=#{refreshToken}"
      end

      @headers = {"Content-Type" => "application/x-www-form-urlencoded", 
                    "Authorization" => environment.authorizationString()}
      @verb = "POST"
    end
    
  end
  
end

