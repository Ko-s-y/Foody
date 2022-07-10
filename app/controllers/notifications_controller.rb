class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.passive_notifications.order(created_at: :desc)
    @notifications = @notifications.where.not(visitor_id: current_user.id)
    @notifications = @notifications.where(checked: false)
  end
end
