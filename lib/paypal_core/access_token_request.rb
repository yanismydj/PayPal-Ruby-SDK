require 'net/http'

module PayPalCore
  
  class PayPalAccessTokenRequest < Net::HTTPGenericRequest
        
    def initialize(environment, refreshToken=nil)
      path = "/v1/oauth2/token"
      body = "grant_type=client_credentials"

      if (refreshToken)
        path = "/v1/identity/openidconnect/tokenservice"
        body += "refresh_token=#{refreshToken}"
      end

      initheader = {"Content-Type" => "application/x-www-form-urlencoded", 
                    "Authorization" => environment.authorizationString()}
      super "POST", true, true, path, initheader
      @body = body
    end
    
  end
  
end

