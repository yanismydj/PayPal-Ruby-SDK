# This class was generated on Thu, 01 Feb 2018 12:44:50 PST by version 0.1.0-dev+3a517e of Braintree SDK Generator
# template_delete_request.rb
# @version 0.1.0-dev+3a517e
# @type request
# @data H4sIAAAAAAAC/2SQQW/iMBCF7/srrHe2CLtH31YkK9DutrRFvVSoMvFAXDm2a09QI8R/r9JARen109PM994BN7olKDC10WmmiSFHTJAoKdfJRrbBQ6H8wFlocU5KsenFopxA4q6j1C910i0xpQz1tJaYkzaUrumfkNprttTcfGEHrPo4WGVO1u8g8aiT1RtHV7bP1kDiL/Un/k171ZBYlCJsBTf0qS44iLHnYP87Jd2PD6cS96TNrXc91Fa7TAN47WwiA8WpI4llCpESW8pQvnPuuB4zlHk8MsAB5Rh8pks2C57Jn2LQMTpb68G0eMnBQ2LOHP8TN8EMk1f/qlWFcR8oFPufhfX7YGvrd8W5Sy4OF2scIVG9RaqZzANr7vIsGIL6NZ0ef7wDAAD//w==
# DO NOT EDIT
require 'cgi'

module PayPal
  module V1
    module Invoices

      #
      # Deletes a template, by ID.
      #
      class TemplateDeleteRequest
        attr_accessor :path, :body, :headers, :verb

        def initialize(template_id)
          @headers = {}
          @body = nil
          @verb = "DELETE"
          @path = "/v1/invoicing/templates/{template_id}?"

          @path = @path.gsub("{template_id}", CGI::escape(template_id.to_s))
          @headers["Content-Type"] = "application/json"
        end
      end
    end
  end
end
