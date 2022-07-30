class ContactsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact, current_user).deliver
      flash[:notice] = "お問い合わせ内容を送信しました。"
      redirect_to posts_path
    else
      flash.now[:alert] = "内容の送信に失敗しました。"
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :content)
  end
end
