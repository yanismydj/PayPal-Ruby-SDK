# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paypal/core/version'

Gem::Specification.new do |gem|
  gem.name          = "paypal-sdk-rest"
  gem.version       = PayPal::VERSION
  gem.authors       = ["PayPal"]
  gem.email         = ["DL-PP-RUBY-SDK@paypal.com"]
  gem.summary       = %q{The PayPal REST SDK provides Ruby APIs to create, process and manage payment.}
  gem.description   = %q{The PayPal REST SDK provides Ruby APIs to create, process and manage payment.}
  gem.homepage      = "https://developer.paypal.com"

  gem.license       = "PayPal SDK License"

  gem.files         = Dir["{bin,spec,lib}/**/*"] + ["README.md", "Gemfile"] + Dir["data/*"]
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency('braintreehttp', '~> 0.5.0')
end
