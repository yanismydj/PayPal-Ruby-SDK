describe PayPalCore::PayPalHttpClient do
  
  before do
    WebMock.disable!
    @environment = PayPalCore::SandboxEnvironment.new('clientId', 'clientSecret')
    @httpClient = PayPalCore::PayPalHttpClient.new(@environment)
  end
  
  # Helpers
  def stubAccessToken
    access_token_json = JSON.generate({
      :access_token => "simple-access-token",
      :expires_in => 3600,
      :token_type => 'Bearer'
    })
    
    stub_request(:any, @environment.base_url + "/v1/oauth2/token").
      to_return(body: access_token_json, status: 200,
                headers: { 'content-type' => "application/json" })    
  end
  
  def stubRefreshToken
    access_token_json = JSON.generate({
      :access_token => "refresh-access-token",
      :expires_in => 3600,
      :token_type => 'Bearer'
    })
    
    stub_request(:any, @environment.base_url + "/v1/identity/openidconnect/tokenservice").
      to_return(body: access_token_json, status: 200,
                headers: { 'content-type' => "application/json" })    
  end
  
  describe 'execute' do
    it 'fetches access token if not yet fetched' do
      WebMock.enable!
      access_token_stub = stubAccessToken

      return_json = JSON.generate({
        :some_key => "some_value"
      })
      
      stub_request(:any, @environment.base_url).
        to_return(body: return_json, status: 204,
                  headers: { 'content-type' => "application/json" })

      req = OpenStruct.new({:verb => "GET", :path => "/"})
      
      resp = @httpClient.execute(req)

      expect(resp.status_code).to eq("204")
      expect(resp.result[:some_key]).to eq("some_value")
      assert_requested(access_token_stub)
    end
    
    it 'does not fetch access token if not expired and valid' do
      WebMock.enable!
      access_token_stub = stubAccessToken

      return_json = JSON.generate({
        :some_key => "some_value"
      })
      
      response_stub = stub_request(:any, @environment.base_url).
        to_return(body: return_json, status: 204,
                  headers: { 'content-type' => "application/json" })

      req = OpenStruct.new({:verb => "GET", :path => "/"})

      resp = @httpClient.execute(req)

      expect(resp.status_code).to eq("204")
      expect(resp.result[:some_key]).to eq("some_value")

      resp = @httpClient.execute(req)
      
      assert_requested(access_token_stub, times: 1)
      assert_requested(response_stub, times: 2)
    end
    
    it 'fetches access token if expired' do
      WebMock.enable!
      
      expired_access_token_json = JSON.generate({
        :access_token => "expired-access-token",
        :expires_in => -1,
        :token_type => 'Bearer'
      })
      
      access_token_json = JSON.generate({
        :access_token => "simple-access-token",
        :expires_in => 3600,
        :token_type => 'Bearer'
      })
    
      access_token_stub = stub_request(:any, @environment.base_url + "/v1/oauth2/token").
        to_return(body: expired_access_token_json, status: 204,
                  headers: { 'content-type' => "application/json" }).
        times(1).
        then.
        to_return(body: access_token_json, status: 204,
                  headers: { 'content-type' => "application/json" })

      return_json = JSON.generate({
        :some_key => "some_value"
      })
      
      response_stub = stub_request(:any, @environment.base_url).
        to_return(body: return_json, status: 204,
                  headers: { 'content-type' => "application/json" })

      req = OpenStruct.new({:verb => "GET", :path => "/"})
      
      resp = @httpClient.execute(req)

      expect(resp.status_code).to eq("204")
      expect(resp.result[:some_key]).to eq("some_value")

      resp = @httpClient.execute(req)
      
      assert_requested(access_token_stub, times: 2)
      assert_requested(response_stub, times: 2) 
    end

    it 'fetches access token with refresh token not yet fetched' do
      WebMock.enable!
      @httpClient = PayPalCore::PayPalHttpClient.new(@environment, "refresh-token")
      refresh_token_stub = stubRefreshToken

      return_json = JSON.generate({
        :some_key => "some_value"
      })
      
      stub_request(:any, @environment.base_url).
        to_return(body: return_json, status: 204,
                  headers: { 'content-type' => "application/json" })

      req = OpenStruct.new({:verb => "GET", :path => "/"})
      
      resp = @httpClient.execute(req)

      expect(resp.status_code).to eq("204")
      expect(resp.result[:some_key]).to eq("some_value")
      assert_requested(refresh_token_stub)
    end
    
    it 'fetches access token with refresh token if expired' do
      WebMock.enable!
      @httpClient = PayPalCore::PayPalHttpClient.new(@environment, "refresh-token")
      
      expired_access_token_json = JSON.generate({
        :access_token => "expired-access-token",
        :expires_in => -1,
        :token_type => 'Bearer'
      })
      
      access_token_json = JSON.generate({
        :access_token => "refresh-access-token",
        :expires_in => 3600,
        :token_type => 'Bearer'
      })
    
      access_token_stub = stub_request(:any, @environment.base_url + "/v1/identity/openidconnect/tokenservice").
        to_return(body: expired_access_token_json, status: 204,
                  headers: { 'content-type' => "application/json" }).
        times(1).
        then.
        to_return(body: access_token_json, status: 204,
                  headers: { 'content-type' => "application/json" })

      return_json = JSON.generate({
        :some_key => "some_value"
      })
      
      response_stub = stub_request(:any, @environment.base_url).
        to_return(body: return_json, status: 204,
                  headers: { 'content-type' => "application/json" })

      req = OpenStruct.new({:verb => "GET", :path => "/"})
      
      resp = @httpClient.execute(req)

      expect(resp.status_code).to eq("204")
      expect(resp.result[:some_key]).to eq("some_value")

      resp = @httpClient.execute(req)
      
      assert_requested(access_token_stub, times: 2)
      assert_requested(response_stub, times: 2) 
    end

    it 'sets Accept-Encoding header to gzip' do
      WebMock.enable!
      access_token_stub = stubAccessToken

      return_json = JSON.generate({
        :some_key => "some_value"
      })
      
      request_stub = stub_request(:any, @environment.base_url).
        to_return(body: return_json, status: 204,
                  headers: { 'content-type' => "application/json" })

      req = OpenStruct.new({:verb => "GET", :path => "/"})
      
      resp = @httpClient.execute(req)

      expect(resp.status_code).to eq("204")
      expect(resp.result[:some_key]).to eq("some_value")
      expect(WebMock).to have_requested(:get, @environment.base_url).
        with(headers: {'Accept-Encoding' => 'gzip'})
    end
  end

  describe 'serializeRequest' do
    it 'does not modify body when Content-Type header not set' do
      req = OpenStruct.new({:verb => "POST", :path => "/"})      
      req.body = "my - [ string ..;"
      serializedBody = @httpClient.serializeRequest(req)
      expect(serializedBody).to eq("my - [ string ..;")
    end
    
    it 'serializes request body when present and Content-Type set to application/json' do
      request_body_json = {
        :some_key => "some_value"
      }
      req = OpenStruct.new({:verb => "POST", :path => "/", :headers => {"Content-Type" => "application/json"}})      
      req.body = request_body_json
      serializedBody = @httpClient.serializeRequest(req)
      expect(serializedBody).to eq("{\"some_key\":\"some_value\"}")
    end
  end

  describe 'deserializeResponse' do
    it 'does not modify body when Content-Type header not set' do
      deserializedBody = @httpClient.deserializeResponse("my - [ string ..;", {})
      expect(deserializedBody).to eq("my - [ string ..;")
    end
    
    it 'deserializes request body when present and Content-Type set to application/json' do
      request_body_json = OpenStruct.new({
        :some_key => "some_value"
      })
      deserializedBody = @httpClient.deserializeResponse("{\"some_key\":\"some_value\"}", {"content-type" => "application/json"})
      expect(deserializedBody).to eq(request_body_json)
    end
  end
  
end
