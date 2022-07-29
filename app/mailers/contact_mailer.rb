class ContactMailer < ApplicationMailer
  # ENV["FOODY_ADMIN_ADDRESS"]は本番環境で使用しているadminのheroku環境変数のicloudアドレス
  # ENV["FOODY_PRODUCTION_USER"]は本番環境で使用しているadminのheroku環境変数のgmailアドレス
  # ENV["USER_ADDRESS"]は開発環境用の.env環境変数のicloudアドレス
  # ENV["ACTION_MAILER_USER"]は開発環境用の.env環境変数のgmailアドレス

  def contact_mail(contact, user)
    @contact = contact
    mail from: '"Foody運営" <noreply@foody.com>',
         to: user.email,
         bcc: ENV["FOODY_PRODUCTION_USER"],
         bcc: ENV["ACTION_MAILER_USER"],
         subject: "お問い合わせについて【自動送信】"
  end
end
