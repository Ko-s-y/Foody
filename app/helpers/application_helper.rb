module ApplicationHelper
  BASE_TITLE = "Foody!".freeze

  def full_title(page_title)
    page_title.blank? ? BASE_TITLE : "#{page_title} - #{BASE_TITLE}"
  end

  def elapsed_time_counter(datetime)
    time_ago_in_words(datetime, include_seconds: true) + '前'
  end

  # userのimage
  def avatar_url(user)
    if user.avatar.attached?
      url_for(user.avatar)
    elsif user.image?
      user.image
    else
      ActionController::Base.helpers.asset_path('icon_default_avatar.jpg')
    end
  end

  # post, commentのimage
  def post_image_url(post)
    if post.avatar.attached?
      url_for(post.avatar)
    elsif post.image?
      post.image
    else
      ActionController::Base.helpers.asset_path('tortelli.jpg')
    end
  end

  def new_notifications(user)
    user.passive_notifications.where(checked: false)
  end
end
