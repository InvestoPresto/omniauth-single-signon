require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Signout
      include OmniAuth::Strategy

      option :name, 'signout'
      option :site, 'http://login.investopresto.com'
      option :signout_path, '/signout'

      def request_phase
        redirect single_signout_url
      end

      def single_signout_url
        "#{options.site}#{options.signout_path}?redirect_uri=#{CGI.escape callback_url}"
      end

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end
