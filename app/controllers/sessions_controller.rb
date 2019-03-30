class SessionsController < ApplicationController
  def new
    puts "aaaa"
  end
  
  def create
    user = User.find_by(login_code: params[:login_code].downcase)
    if user && user.authenticate(params[:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to login_path
  end
  
end
