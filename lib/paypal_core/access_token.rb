module PayPalCore
  
  class PayPalAccessToken
    
    attr_accessor :access_token, :token_type, :expires_in, :date_created
    
    def initialize(options)
      self.access_token = options.access_token
      self.token_type = options.token_type
      self.expires_in = options.expires_in * 1000
      self.date_created = Time.now
    end
    
    def isExpired() 
      return Time.now > self.date_created + self.expires_in;
    end
        
    def authorizationString() 
      return "#{self.token_type} #{self.access_token}"
    end
    
  end
end

