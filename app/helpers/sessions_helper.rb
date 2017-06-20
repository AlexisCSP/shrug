module SessionsHelper

  # logs in the user
  def log_in(user)
    session[:user_id] = user.id
  end

  # returns current logged in user, if any
  def current_user
    if @current_user.nil?
      @current_user = User.find_by(id: session[:user_id])
    else
      @current_user
    end
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end
end
