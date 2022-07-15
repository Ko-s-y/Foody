class ContactMailer < ApplicationMailer

  def contact_mail(contact, user)
    @contact = contact
    mail
      from: '"Foody運営" <noreply@yoursite.com>',
      to: user.email,
      bcc: ENV["FOODY_PRODUCTION_USER"], # 本番環境heroku環境変数,gmailアドレス
      bcc: ENV["FOODY_ADMIN_ADDRESS"], # 本番環境heroku環境変数,icloudアドレス
      bcc: ENV["ACTION_MAILER_USER"], # 開発環境用.env変数,gmailアドレス
      bcc: ENV["USER_ADDRESS"], # 開発環境用.env変数,icloudアドレス
      subject: "お問い合わせについて【自動送信】"
  end
end
