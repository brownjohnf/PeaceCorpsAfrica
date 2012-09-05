unless Rails.env.production?
  ENV['MAILGUN_SMTP_SERVER'] = ''
  ENV['MAILGUN_SMTP_PORT'] = ''
  ENV['MAILGUN_SMTP_LOGIN'] = ''
  ENV['MAILGUN_SMTP_PASSWORD'] = ''
  ENV['DOMAIN'] = ''
end
