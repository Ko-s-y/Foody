class NotificationsController < ApplicationController
  before_action :authenticate_user!, :specify_order_desc, only: [:index, :checked]
  after_action :checked_true!, only: :index

  def index
    @notifications = @my_notifications.where(checked: false)
  end

  def checked
    @checked_notifications = @my_notifications.where.not(visitor_id: current_user.id).page(params[:page]).per(30)
  end

  private

  def specify_order_desc
    @my_notifications = current_user.passive_notifications.order(created_at: :desc)
  end

  # index訪れたら既読にする
  def checked_true!
    @notifications.each do |notification|
      notification.update(checked: true)
    end
  end
end
