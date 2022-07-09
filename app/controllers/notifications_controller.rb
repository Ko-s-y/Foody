class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.passive_notifications.order(created_at: :desc)
    @notifications = @notifications.where.not(visitor_id: current_user.id)
    @notifications = @notifications.where(checked: false)
    # notifications訪れるとその時表示されたnotificationsは全て既読になる仕様
    # @notifications.where(checked: false).each do |notification|
    #   notification.update(checked: true)
    # end
  end
end
