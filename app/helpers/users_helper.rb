module UsersHelper
  def avatar_for(user)
    image_tag(user.avatar.url(:thumb), alt: user.name, class: "avatar")
  end
end
