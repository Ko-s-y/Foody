class ContactsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]

  def index
    @contacts = current_user.contacts.order(id: :desc)
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact, current_user).deliver
      flash[:notice] = "お問い合わせ内容を送信しました。"
      redirect_to contacts_path
    else
      flash.now[:alert] = "内容の送信に失敗しました。"
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:user_id, :name, :title, :content)
  end
end
