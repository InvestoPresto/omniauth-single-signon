require 'single_signon'
require 'signout'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer if Rails.env.development?
  provider :single_signon, ENV['INVESTOPRESTO_KEY'], ENV['INVESTOPRESTO_SECRET']
  provider :signout
end
