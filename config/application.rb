require_relative 'boot'

require 'rails/all'

require 'conekta'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Conekta
  class Application < Rails::Application
	Conekta.api_key = Rails.application.secrets.conekta_private
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end