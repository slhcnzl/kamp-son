# encoding: utf-8

module ProfileHelper
  def has_an_avatar
    if @profile.avatar.url == nil
      image_tag("male.png", size: "180x180")
    else
      image_tag(@profile.avatar, size: "180x180")
    end
  end
end