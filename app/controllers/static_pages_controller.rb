class StaticPagesController < ApplicationController
  def home
    if logged_in?
      redirect_to homepostlogin_path
    end
  end
  # TODO fix the homepostlogin controller 
  def homepostlogin
    if !logged_in?
      redirect_to root_path
    end
  end
  def aboutpage
  end
  def helppage
  end
end
