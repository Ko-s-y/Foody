class ContactMailer < ApplicationMailer
  def contact_mail(contact, user)
    @contact = contact
    mail from: '"Foody運営" <noreply@foody.com>',
         to: user.email,
         bcc: ENV["FOODY_PRODUCTION_USER"],
         subject: "お問い合わせについて【自動送信】"
  end
end
