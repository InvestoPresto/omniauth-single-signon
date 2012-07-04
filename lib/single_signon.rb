require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class SingleSignon < OmniAuth::Strategies::OAuth2


      option :name, 'single_signon'
      option :client_options, {
        :site => 'http://login.investopresto.com'
      }

      uid { raw_info['id'] }

      info do
        {
          :email => raw_info['email']
        }
      end

      extra do
        {
          :raw_info => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get("/oauth/user.json").parsed
      rescue ::Errno::ETIMEDOUT
        raise ::Timeout::Error
      end
    end
  end
end
