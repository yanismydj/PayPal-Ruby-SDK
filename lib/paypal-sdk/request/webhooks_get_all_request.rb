# This class was generated on Thu, 15 Jun 2017 16:02:42 PDT by version 0.01 of Braintree SDK Generator
# webhooks_get_all_request.rb
# DO NOT EDIT
# @type request
# @json {"Name":"webhooks.get-all","Description":"Lists all webhooks for an app.","Parameters":[{"Type":"string","VariableName":"anchor_type","Description":"Filters the response by an entity type, `anchor_id`. Value is `APPLICATION` or `ACCOUNT`. Default is `APPLICATION`.","IsArray":false,"ReadOnly":false,"Visible":false,"Required":false,"Properties":null,"Location":"query"}],"RequestType":null,"ResponseType":{"Type":"WebhookList","VariableName":"","Description":"List of webhooks.","IsArray":false,"ReadOnly":false,"Visible":false,"Required":false,"Properties":null},"ContentType":"application/json","HttpMethod":"GET","Path":"/v1/notifications/webhooks","Visible":true,"ExpectedStatusCode":200}

require 'net/http'

=begin
Lists all webhooks for an app.
=end

module PayPalRequest

  class WebhooksGetAllRequest < Net::HTTPGenericRequest

    def initialize()
      initheader = {"Content-Type" => "application/json"}
      super "GET", true, true, "/v1/notifications/webhooks?", initheader
    end

    def anchorType(anchorType)
        @path += @path + "anchor_type=" + anchorType + "&"
    end

    

  end

end