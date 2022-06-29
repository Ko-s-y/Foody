module ApplicationHelper
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

  # postのimage
  def post_image_url(post)
    if post.avatar.attached?
      url_for(post.avatar)
    elsif post.image?
      post.image
    else
      ActionController::Base.helpers.asset_path('tortelli.jpg')
    end
  end
end
