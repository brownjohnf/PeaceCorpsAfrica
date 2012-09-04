Pony.options = {
  :from => "noreply@#{ENV['DOMAIN']}",
  :via => :smtp,
  :via_options => {
    :address => ENV['MAILGUN_SMTP_SERVER'],
    :port => ENV['MAILGUN_SMTP_PORT'],
    :user_name => ENV['MAILGUN_SMTP_LOGIN'],
    :password => ENV['MAILGUN_SMTP_PASSWORD'],
    :authentication => :plain,
    :domain => ENV['DOMAIN']
  }
}
