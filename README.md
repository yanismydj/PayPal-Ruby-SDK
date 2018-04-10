# PayPal SDK 2.0-beta [![Build Status](https://travis-ci.org/paypal/PayPal-Ruby-SDK.svg?branch=2.0-beta)](https://travis-ci.org/paypal/PayPal-Ruby-SDK)

This is a preview of how PayPal SDKs will look in the next major version. We've simplified the interface to only provide HTTPRequest that can easily be called via our HttpClient.

## What's New

Please see the [CHANGELOG.md](./CHANGELOG.md) for the latest changes.

## Example

### Creating a Payment

```ruby
require 'paypal-sdk-rest'

include PayPal::V1::Payments

environment = PayPal::SandboxEnvironment.new('AdV4d6nLHabWLyemrw4BKdO9LjcnioNIOgoz7vD611ObbDUL0kJQfzrdhXEBwnH8QmV-7XZjvjRWn0kg', 'EPKoPC_haZMTq5uM9WXuzoxUVdgzVqHyD5avCyVC1NCIUJeVaNNUZMnzduYIqrdw-carG9LBAizFGMyK')
client = PayPal::PayPalHttpClient.new(environment)

payment = {
  :intent => "sale",
  :transactions => [
    :amount => {
      :currency => "USD",
      :total => "10"
    }
  ],
  :redirect_urls => {
    :cancel_url => "http://example.com/cancel",
    :return_url => "http://example.com/return"
  },
  :payer => {
    :payment_method => "paypal"
  }
}


request = PaymentCreateRequest.new
request.request_body(payment);

begin
  response = client.execute(request)
  puts response.status_code
  puts response.result
rescue BraintreeHttp::HttpError => e
  puts e.status_code
  puts e.result
end
```

If you're migrating from v1, check out our [Migration Guide](./docs/Migrating.md) or our [Frequently Asked Questions](./docs/FAQ.md).

## Building

To try this out, update the version of `paypalrestsdk` in your `Gemfile` to `2.0.0.rc2`.

Please feel free to create an issue in this repo with any feedback, questions, or concerns you have.

## Running tests

To run integration tests using your client id and secret, clone this repository and run the following command:
```sh
$ bundle install
$ rspec spec/integration
```

*NOTE*: This API is still in beta, is subject to change, and should not be used in production.

## Feedback

If you have any suggestions/remarks/feedback related to SDK 2.0.0, feel free to create an issue.

## License
PayPal-Ruby-SDK is open source. See the [LICENSE](./LICENSE) file for more info.

## Contributions
Pull requests and new issues are welcome. See [CONTRIBUTING.md](CONTRIBUTING.md) for details.
