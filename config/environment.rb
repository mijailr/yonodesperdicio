# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Yonodesperdicio::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => Rails.application.secrets.emails["smtp_username"],
  :password => Rails.application.secrets.emails["smtp_password"],
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
