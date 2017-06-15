$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name = "paypal-sdk-rest"
  s.summary = "PayPal Client Library"
  s.description = "Used for API clients"
  s.version = "1.0.0"
  s.license = "MIT"
  s.author = "PayPal"
  s.email = "code@getbraintree.com"
  s.homepage = "http://www.paypal.com/"
  s.rubyforge_project = "paypal-sdk-rest"
  s.has_rdoc = false
  s.files = Dir.glob ["lib/**/*.{rb,crt}", "spec/**/*", "*.gemspec"]
  s.add_dependency "builder", ">= 2.0.0"
end
