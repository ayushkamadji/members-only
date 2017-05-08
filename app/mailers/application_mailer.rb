class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@members-only.com'
  layout 'mailer'
end
