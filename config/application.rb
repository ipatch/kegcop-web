require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Kegcop

  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Load the environment variables at beginning
    config.before_configuration do
        env_file = File.join(Rails.root, 'config', 'local_env.yml')
        YAML.load(File.open(env_file)).each do |key, value|
        ENV[key.to_s] = value
        end if File.exists?(env_file)
    end

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

   # config.middleware.use Helios::Application do
   #  glob = "vendor/*.xcdatamodeld*"
   #  Dir[glob].each do |path|
   #      service :data, model: path
   #  end
   # end

   # don't generate RSpec tests for views and helpers
    # config.generators do |g|
    #   g.test_framework :rspec, fixture: true
    #   g.fixture_replacement :factory_girl, dir: 'spec/factories'
    #   g.view_specs false
    #   # g.helper_specs false
    #   g.stylesheets = false
    #   g.javascripts = false
    #   # g.helper = false # me thinks this line prevents RSpec from generating tests for models
    # end
  end
end