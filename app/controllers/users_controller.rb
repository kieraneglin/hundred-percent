class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new allowed_params
    if @user.save
      # render text: @user.inspect
      UserMailer.registration_confirmation(@user).deliver
      redirect_to root_path, notice: "Account created successfully!"
    else
      render :new
    end
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      flash[:success] = "Your email has been confirmed!  Please sign in to continue"
      redirect_to session_path
    else
      redirect_to root_path, alert: "Sorry. User does not exist"
    end
  end

  private

  def allowed_params
    params.require(:user).permit('email', 'name', 'password')
  end
end
