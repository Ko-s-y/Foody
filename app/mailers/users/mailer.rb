class Users::Mailer < Devise::Mailer
  helper :application
  include Devise::Controllers::UrlHelpers
  default template_path: 'devise/mailer'
  default from: 'Foody運営<noreply@gmail.com>'
  default reply_to: 'sample@gmail.com'

  # def confirmation_instructions(record, token, opts={})
  #   opts[:subject] = "アカウントの有効化について"
  #   super
  # end

  # def reset_password_instructions(record, token, opts={})
  #   opts[:subject] = "パスワードの再設定について"
  #   super
  # end
end
