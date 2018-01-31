require 'braintreehttp'
require_relative '../../lib/lib'

module TestHarness
  def self.environment
    client_id = ENV['PAYPAL_CLIENT_ID'] || 'AdV4d6nLHabWLyemrw4BKdO9LjcnioNIOgoz7vD611ObbDUL0kJQfzrdhXEBwnH8QmV-7XZjvjRWn0kg'
    client_secret = ENV['PAYPAL_CLIENT_SECRET'] || 'EPKoPC_haZMTq5uM9WXuzoxUVdgzVqHyD5avCyVC1NCIUJeVaNNUZMnzduYIqrdw-carG9LBAizFGMyK'

    PayPal::SandboxEnvironment.new(client_id, client_secret)
  end

  def self.client
    PayPal::PayPalHttpClient.new(self.environment)
  end
end
