class ContactMailer < ApplicationMailer
  # ENV["FOODY_ADMIN_ADDRESS"]は本番環境用のadminのheroku環境変数のicloudアドレス
  # ENV["FOODY_PRODUCTION_USER"]は本番環境用のadminのheroku環境変数のgmailアドレス
  # ENV["ACTION_MAILER_USER"]は開発環境用の.env環境変数のgmailアドレス
  # ENV["USER_ADDRESS"]は開発環境用の.env環境変数のicloudアドレス

  def contact_mail(contact, user)
    @contact = contact
    mail from: '"Foody運営" <noreply@yoursite.com>', to: user.email, bcc: ENV["FOODY_ADMIN_ADDRESS"], bcc: ENV["FOODY_PRODUCTION_USER"], bcc: ENV["ACTION_MAILER_USER"], bcc: ENV["USER_ADDRESS"], subject: "お問い合わせについて【自動送信】"
  end
end
