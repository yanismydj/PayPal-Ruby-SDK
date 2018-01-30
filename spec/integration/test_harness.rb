require 'braintreehttp'

module TestHarness

  class TestEnvironment < BraintreeHttp::Environment
    def initialize
      super(ENV["BASE_URL"])
    end
  end

  def self.client
    Petstore::PetstoreHttpClient.new(TestEnvironment.new)
  end
end
