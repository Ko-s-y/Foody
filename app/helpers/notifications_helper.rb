module NotificationsHelper
  def info_time(datetime)
    time_ago_in_words(datetime, include_seconds: true) + '前'
  end
end
