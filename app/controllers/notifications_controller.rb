class NotificationsController < ApplicationController
  before_action :authenticate_user!
  after_action :checked_true!, only: :index

  def index
    @notifications = current_user.passive_notifications.where(checked: false).order(created_at: :desc)
  end

  def checked
    @checked_notifications = current_user.passive_notifications.where.not(visitor_id: current_user.id).order(created_at: :desc).page(params[:page]).per(30)
  end

  private

  # notifications訪れたら既読にする
  def checked_true!
    @notifications.each do |notification|
      notification.update(checked: true)
    end
  end
end
