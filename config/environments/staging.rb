# Staging configuration must be identical to production, with some overrides
# for hostname, etc.

require_relative './production'

Rails.application.configure do
  # # Email overrides
  # config.action_mailer.asset_host = 'https://staging.your-domain.tld'
  # config.action_mailer.default_url_options = {
  #   host: 'staging.your-domain.tld',
  #   protocol: 'https'
  # }
end

# Intercept all email sent in staging, and forward them to the
# STAGING_MAIL_INTERCEPT_EMAIL_RECIPIENTS
Mail.register_interceptor RecipientInterceptor.new(
  ENV.fetch('STAGING_MAIL_INTERCEPT_EMAIL_RECIPIENTS'),
  subject_prefix: '[STAGING]'
)
