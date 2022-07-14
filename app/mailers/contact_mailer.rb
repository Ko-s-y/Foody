class ContactMailer < ApplicationMailer

  def contact_mail(contact, user)
    @contact = contact
    mail to: user.email, bcc: ENV["ACTION_MAILER_USER"], bcc: ENV["USER_ADDRESS"], subject: "お問い合わせについて【自動送信】"
  end
end
