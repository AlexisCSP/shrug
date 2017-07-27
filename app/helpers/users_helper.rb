module UsersHelper
  def get_img_path
    if current_user.image.blank?
      user_image = asset_path("default.jpg")
    else
      user_image = asset_path(current_user.image)
      def_image = user_image.split('/')
      def_image = user_image.last()
      if def_image == "default.jpg"
        user_image = asset_path(def_image)
      end
    end
    return user_image
  end
end
