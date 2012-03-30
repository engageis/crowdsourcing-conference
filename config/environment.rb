# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Ccs12::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => "587",
  :domain => "localhost.localdomain",
  :authentication => :plain,
  :user_name => ENV["GMAIL_SMTP_USER"],
  :password => ENV["GMAIL_SMTP_PASSWORD"]
}