class NotificationsController < ApplicationController
  before_action :authenticate_user!
  after_action :checked_true!, only: :index

  def index
    @notifications = current_user.passive_notifications.
                                  where(checked: false).
                                  order(created_at: :desc)
  end

  private

  # notifications訪れたら既読にする
  def checked_true!
    @notifications.each do |notification|
      notification.update(checked: true)
    end
  end
end
