class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email params[:email]

    if user && user.authenticate(params[:password])
      if user.email_confirmed
        session[:user_id] = user.id
        redirect_to root_path, notice: "Logged in!"
      else
        flash.now[:alert] = 'Account not activated!  Please check your email'
        render :new
      end
    else
      flash.now[:alert] = "Invalid Credentials"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged Out!"
  end
end
