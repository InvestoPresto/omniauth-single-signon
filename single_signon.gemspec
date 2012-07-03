$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "single_signon/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "single_signon"
  s.version     = SingleSignon::VERSION
  s.authors     = ["Sankara Narayanan", "Subhash Chandra"]
  s.email       = ["sankara.narayanan@investopresto.com", "TMaYaD+github@gmail.com"]
  s.homepage    = "https://github.com/InvestoPresto/single_signon"
  s.summary     = %q{Single singon engine for authentication}
  s.description = %q{Single singon engine for authentication}


  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency 'rails', '~> 3.2.6'
  s.add_dependency 'active_attr'
  s.add_dependency 'haml-rails'
  s.add_dependency 'simple_form'
  s.add_dependency 'omniauth'
  s.add_dependency 'omniauth-investopresto'
  # s.add_dependency 'jquery-rails'

  s.add_development_dependency 'sqlite3', '~> 1.3.5'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'shoulda-matchers'
end
