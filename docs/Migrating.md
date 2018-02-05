# Migrating from Version 1 to Version 2

## 1. Initialize SDK

#### BEFORE
```ruby
PayPal::SDK.configure(
  :mode => "sandbox", # "sandbox" or "live"
  :client_id => "EBWKjlELKMYqRNQ6sYvFo64FtaRLRR5BdHEESmha49TM",
  :client_secret => "EO422dn3gQLgDbuwqTjzrFgFtaRLRR5BdHEESmha49TM",
  :ssl_options => { } )
```

#### AFTER
```ruby
require 'paypal-sdk-rest'

environment = PayPal::SandboxEnvironment.new('your_client_id', 'your_client_secret')
client = PayPal::PayPalHttpClient.new(environment)
```

# 2. Make a call

#### BEFORE
```ruby
@payment = Payment.new({
  :intent =>  "sale",
  :payer =>  {
    :payment_method =>  "paypal" },
  :redirect_urls => {
    :return_url => "http://localhost:3000/payment/execute",
    :cancel_url => "http://localhost:3000/" },
  :transactions =>  [{
    :item_list => {
      :items => [{
        :name => "item",
        :sku => "item",
        :price => "5",
        :currency => "USD",
        :quantity => 1 }]},
    :amount =>  {
      :total =>  "5",
      :currency =>  "USD" },
    :description =>  "This is the payment transaction description." }]})

if @payment.create
  @payment.id     # Payment Id
else
  @payment.error  # Error Hash
end
```

#### AFTER
```ruby
include PayPal::V1::Payments

request = PaymentCreateRequest.new
request.request_body({
  :intent =>  "sale",
  :payer =>  {
    :payment_method =>  "paypal" },
  :redirect_urls => {
    :return_url => "http://localhost:3000/payment/execute",
    :cancel_url => "http://localhost:3000/" },
  :transactions =>  [{
    :item_list => {
      :items => [{
        :name => "item",
        :sku => "item",
        :price => "5",
        :currency => "USD",
        :quantity => 1 }]},
    :amount =>  {
      :total =>  "5",
      :currency =>  "USD" },
    :description =>  "This is the payment transaction description." }]})

request = PaymentCreateRequest.new

begin
	payment_create_response = client.execute(request)
rescue IOError => e
	if e.is_instance? BraintreeHttp::HttpError
		puts e.result
		puts e.status_code
	end
end
```

