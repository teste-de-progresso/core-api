# frozen_string_literal: true

require_relative "boot"

require "rails"

require "active_model/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_cable/engine"

Bundler.require(*Rails.groups)

Dotenv::Railtie.load unless Rails.env.production?

module ProgressTest
  class Application < Rails::Application
    config.load_defaults(6.0)
    config.api_only = true
    config.middleware.insert_after(ActionDispatch::Static, Rack::Deflater)
  end
end
