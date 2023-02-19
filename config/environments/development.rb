require_relative './common.rb'

Rails.application.configure do
  APP_CONFIG ||= ConfigLoader.load_app_config

  # Settings specified here will take precedence over those in config/environment.rb
  config.consider_all_requests_local = true
  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the webserver when you make code changes.
  config.cache_classes = false
  #config.hosts << /(.*\.)?lvh.me/
  config.hosts << "telemartuae.com" # Whitelist one hostname
  # To autoload MailPreview, uncomment this line
  # (this is a hack which is fixed properly in Rails 4)
  # config.action_view.cache_template_loading = false

  # Basic log config, for calls to Rails.logger.<level> { <message> }
  config.logger = ::Logger.new(STDOUT)
  # Formats log entries into: LEVEL MESSAGE
  # Heroku adds to this timestamp and worker/dyno id, so datetime can be stripped
  config.logger.formatter = ->(severity, datetime, progname, msg) { "#{severity} #{msg}\n" }
  config.logger = ActiveSupport::TaggedLogging.new(config.logger)

  # Lograge config, overrides default instrumentation for logging ActionController and ActionView logging
  config.lograge.enabled = true
  config.lograge.custom_options = ->(event) {
    params = event.payload[:params].except('controller', 'action')

    { params: params,
      host: event.payload[:host],
      community_id: event.payload[:community_id],
      current_user_id: event.payload[:current_user_id],
      user_agent: event.payload[:user_agent],
      referer: event.payload[:referer],
      forwarded_for: event.payload[:forwarded_for],
      request_uuid: event.payload[:request_uuid] }
  }

  config.lograge.formatter = Lograge::Formatters::Json.new

  config.after_initialize do
    ActiveRecord::Base.logger = Rails.logger.clone
    ActiveRecord::Base.logger.level = Logger::DEBUG
    ActionMailer::Base.logger = Rails.logger.clone
    ActionMailer::Base.logger.level = Logger::INFO
  end


  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true

  # The default should be false, but is not for some reason (some gem sets it to
  # true?), so force it back. Origin checks are problematic because we force no
  # referrer policy and that seems to affect at least password resets.
  config.action_controller.forgery_protection_origin_check = false

  # Enable/disable caching. By default caching is disabled.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true
    config.cache_store = :memory_store, { :namespace => "sharetribe-dev"}
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system (see config/storage.yml for options)
  config.active_storage.service = APP_CONFIG.active_storage_service.to_sym

  config.action_controller.action_on_unpermitted_parameters = :raise

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  if APP_CONFIG.mail_delivery_method == "sendmail"
    ActionMailer::Base.delivery_method = :sendmail
  elsif APP_CONFIG.mail_delivery_method == "smtp"
    # Enable sending mail from localhost
    ActionMailer::Base.smtp_settings = {
      :address              => APP_CONFIG.smtp_email_address,
      :port                 => APP_CONFIG.smtp_email_port,
      :domain               => APP_CONFIG.smtp_email_domain || 'localhost',
      :user_name            => APP_CONFIG.smtp_email_user_name,
      :password             => APP_CONFIG.smtp_email_password,
      :authentication       => 'plain',
      :enable_starttls_auto => true
    }
  end

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise exceptions for disallowed deprecations.
  config.active_support.disallowed_deprecation = :raise

  # Tell Active Support which deprecation messages to disallow.
  config.active_support.disallowed_deprecation_warnings = []

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # Expands the lines which load the assets
  config.assets.debug = false
  config.assets.quiet = true

  # Raises error for missing translations
  config.i18n.raise_on_missing_translations = false
  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  # List of classes deemed safe to be deserialized from YAML.
  config.active_record.yaml_column_permitted_classes = [Symbol, ActiveSupport::HashWithIndifferentAccess]
end
