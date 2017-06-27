class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      if params[:session][:remember_me] == '1'
        remember(user)
      else
        forget(user)
      end
        redirect_back_or user # redirect to page user tried to access
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
     end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
