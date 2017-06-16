# This class was generated on Fri, 16 Jun 2017 12:26:48 PDT by version 0.01 of Braintree SDK Generator
# webhooks_get_all_request_test_spec.rb
# DO NOT EDIT
# @type request-test
# @json {"Name":"webhooks.get-all","Description":"Lists all webhooks for an app.","Parameters":[{"Type":"string","VariableName":"anchor_type","Description":"Filters the response by an entity type, `anchor_id`. Value is `APPLICATION` or `ACCOUNT`. Default is `APPLICATION`.","IsArray":false,"ReadOnly":false,"Visible":false,"Required":false,"Properties":null,"Location":"query"}],"RequestType":null,"ResponseType":{"Type":"WebhookList","VariableName":"","Description":"List of webhooks.","IsArray":false,"ReadOnly":false,"Visible":false,"Required":false,"Properties":null},"ContentType":"application/json","HttpMethod":"GET","Path":"/v1/notifications/webhooks","Visible":true,"ExpectedStatusCode":200,"FileSuffix":"_spec"}

describe PayPalRequest::WebhooksGetAllRequest do

  it 'successfully makes a request' do
    fail "Write this integration test"
  end

end