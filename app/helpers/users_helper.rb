module UsersHelper
  def get_img_path(user)
    if user.image.blank?
      user_image = image_path("default.jpg")
    else
      user_image = image_path(user.image)
      def_image = user_image.split('/')
      image_name = def_image.last()
      image_name = image_name
      if image_name == "default.jpg"
        user_image = image_path(image_name)
      else
        def_image[-1] = image_name
        user_image = def_image.join('/')
      end
    end
    return user_image
  end

  def get_thumb_img_path(user)
    if user.image.blank?
      user_image = image_path("thumb_default.jpg")
    else
      user_image = image_path(user.image)
      def_image = user_image.split('/')
      image_name = def_image.last()
      image_name = "thumb_" + image_name
      if image_name == "thumb_default.jpg"
        user_image = image_path(image_name)
      else
        def_image[-1] = image_name
        user_image = def_image.join('/')
      end
    end
    return user_image
  end
end
