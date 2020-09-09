# frozen_string_literal: true

require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'

Bundler.require(*Rails.groups)

Dotenv::Railtie.load unless Rails.env.production?

module ProgressTest
  class Application < Rails::Application
    config.load_defaults 6.0
    config.api_only = true

    config.to_prepare do
      DeviseController.respond_to :json
    end
  end
end
