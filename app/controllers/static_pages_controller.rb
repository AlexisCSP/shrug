class StaticPagesController < ApplicationController

  before_action :user_authenticated, only: [:home]

  def home
  end

  def homepostlogin
    if !logged_in?
      return redirect_to root_path
    end
    @chat_rooms = ChatRoom.all
  end

  def aboutpage
  end

  def helppage
  end

  private
    def user_authenticated
      if logged_in?
        return redirect_to homepostlogin_path
      end
    end

end
