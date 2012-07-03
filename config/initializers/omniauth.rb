Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer if Rails.env.development?
  provider :investopresto, ENV['INVESTOPRESTO_KEY'], ENV['INVESTOPRESTO_SECRET']
  provider :signout
end
