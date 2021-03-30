# frozen_string_literal: true

Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local = false
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.active_storage.service = :amazon
  config.log_level = :debug
  config.log_tags = [:request_id]
  config.action_mailer.default_url_options = { host: ENV['URL_HOST'] }
  config.action_mailer.perform_caching = false
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    authentication: :plain,
    address: ENV['MAILGUN_SMTP_SERVER'],
    port: ENV['MAILGUN_SMTP_PORT'],
    domain: ENV['MAILGUN_DOMAIN'],
    user_name: ENV['MAILGUN_SMTP_LOGIN'],
    password: ENV['MAILGUN_SMTP_PASSWORD']
  }

  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new

  if ENV['RAILS_LOG_TO_STDOUT'].present?
    logger           = ActiveSupport::Logger.new($stdout)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  config.active_record.dump_schema_after_migration = false

  Sentry.configure do |config|
    config.dsn = ENV['SENTRYURL']
  end
end
