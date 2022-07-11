class NotificationsController < ApplicationController
  before_action :authenticate_user!
  after_action :checked_true!, only: :index

  def index
    @notifications = current_user.passive_notifications.order(created_at: :desc)
    @notifications = @notifications.where.not(visitor_id: current_user.id)
    @notifications = @notifications.where(checked: false)
  end

  private

  def checked_true!
    @notifications.each do |notification|
      notification.update(checked: true)
    end
  end
end
