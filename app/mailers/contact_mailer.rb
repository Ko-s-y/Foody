class ContactMailer < ApplicationMailer
  # ENV["FOODY_ADMIN_ADDRESS"]は本番環境で使用しているadminのheroku環境変数のicloudアドレス
  # ENV["FOODY_PRODUCTION_USER"]は本番環境で使用しているadminのheroku環境変数のgmailアドレス
  # ENV["USER_ADDRESS"]は開発環境用の.env環境変数のicloudアドレス
  # ENV["ACTION_MAILER_USER"]は開発環境用の.env環境変数のgmailアドレス

  # icloudからのメールがbccに環境変数を使うとブロックされる？為捨てアドで設定, bccにメールは届くことを確認

  # mail from: '"Foody運営" <noreply@foody.com>', to: user.email, bcc: ENV["FOODY_ADMIN_ADDRESS"], bcc: ENV["FOODY_PRODUCTION_USER"], bcc: ENV["USER_ADDRESS"], bcc: ENV["ACTION_MAILER_USER"], subject: "お問い合わせについて【自動送信】"

  # def contact_mail(contact, user)
  #   @contact = contact
  #   mail from: '"Foody運営" <noreply@foody.com>', to: user.email, bcc: 'so129@me.com', subject: "お問い合わせについて【自動送信】"
  # end

  def contact_mail(contact, user)
    @contact = contact
    mail from: '"Foody運営" <noreply@foody.com>',
         to: user.email,
         bcc: 'so129@me.com',
         bcc: ENV["FOODY_PRODUCTION_USER"],
         subject: "お問い合わせについて【自動送信】"
  end
end
