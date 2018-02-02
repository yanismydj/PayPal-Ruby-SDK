module PayPal
  module V1
    module Identity
      class UserConsent

        def initialize(environment)
          @url = "#{environment.web_url}/signin/authorize?"
          @params = {
            :client_id => environment.client_id
          }
        end

        def response_type(response_type)
          @params[:response_type] = response_type
        end

        def scope(scope)
          @params[:scope] = scope
        end

        def redirect_uri(redirect_uri)
          @params[:redirect_uri] = redirect_uri
        end

        def nonce(nonce)
          @params[:nonce] = nonce
        end

        def state(state)
          @params[:state] = state
        end

        def build
          url = @url

          @params.each do |key, value|
            url += "#{key}=#{value}&"
          end

          url
        end
      end
    end
  end
end
