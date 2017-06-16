# This class was generated on Fri, 16 Jun 2017 10:45:02 PDT by version 0.01 of Braintree SDK Generator
# event_resend_request_test_spec.rb
# DO NOT EDIT
# @type request-test
# @json {"Name":"event.resend","Description":"Resends a webhook event notification, by ID. Any pending notifications are not resent.","Parameters":[{"Type":"string","VariableName":"event_id","Description":"The ID of the webhook event notification to resend.","IsArray":false,"ReadOnly":false,"Visible":false,"Required":true,"Properties":null,"Location":"path"}],"RequestType":{"Type":"Event Resend","VariableName":"body","Description":"Resends a webhook event notification, by ID.","IsArray":false,"ReadOnly":false,"Visible":false,"Required":false,"Properties":null},"ResponseType":{"Type":"Event","VariableName":"","Description":"A webhook event notification.","IsArray":false,"ReadOnly":false,"Visible":false,"Required":false,"Properties":null},"ContentType":"application/json","HttpMethod":"POST","Path":"/v1/notifications/webhooks-events/{event_id}/resend","Visible":true,"ExpectedStatusCode":200,"FileSuffix":"_spec"}

describe PayPalRequest::EventResendRequest do

  it 'successfully makes a request' do
    fail "Write this integration test"
  end

end