class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(login_code: params[:session][:login_code].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      if params[:session][:remember_me] == '1'
        remember(user)
      else
        forget(user)
      end
      redirect_to user
    else
      flash.now[:danger] = 'Invalid code/password combination'
      render 'new'
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to login_path
  end
  
end
