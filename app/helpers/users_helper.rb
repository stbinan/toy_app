module UsersHelper
  def avatar_for(user, options = {size: :thumb})
    size = options[:size]
    image_tag(user.avatar.url(size), alt: user.name, class: "avatar")
  end
end
