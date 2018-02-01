# This class was generated on Wed, 31 Jan 2018 15:11:28 PST by version 0.1.0-dev+6a771d-dirty of Braintree SDK Generator
# web_profile_delete_request.rb
# @version 0.1.0-dev+6a771d-dirty
# @type request
# @data H4sIAAAAAAAC/2SRT4/TMBDF73wKa87eTeHoG9oE7Yp/BSouaIWc+JUYObYZT9hGVb87Colo6V5/Gnt+896RPtgBZOgJ7U3mtPcBtw4BAtJUo3Tss/gUyVD9Fxdl1RNahUMGe8QOan2nVTuph/qWNH0awdPWsh0g4ELm26Ome1gHvqZvEg/XbGul/48daTflWbMI+/iDNH217G0bsOqvCt+9I01vMa342Q27HuqhVmmvpP8nriSp5ebZ/TWznZZ1G02fYd3HGCYyexsKZvBr9AxHRniEpi2nDBaPQiaOIZwelxkUWT6Z4YxKTrHgkt2lKIjrGNmcg+/sLFr9LCmSpnuR/B7SJzfH37xrdg0t6ZCh6vfLKttpQJSbcxnVRZGlOp5zOZGm5pDRCdwXsTKWu+RA5tVmc3rxBwAA//8=
# DO NOT EDIT

require 'uri'

module PayPal
  module V1
    module PaymentExperience

      #
      # Deletes a web experience profile, by ID.
      #
      class WebProfileDeleteRequest
        attr_accessor :path, :body, :headers, :verb

        def initialize(profile_id)
          @headers = {}
          @body = nil
          @verb = "DELETE"
          @path = "/v1/payment-experience/web-profiles/{profile_id}?"

          @path = @path.gsub("{profile_id}", URI.escape(profile_id.to_s))
          @headers["Content-Type"] = "application/json"
        end
      end
    end
  end
end
