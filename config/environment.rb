# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    user_name:      'anand527',
    password:       'sendgrid87!',
    domain:         'localhost',
    address:       'smtp.sendgrid.net',
    port:          2525,
    authentication: :plain,
    enable_starttls_auto: true
  }

