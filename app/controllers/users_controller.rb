class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new allowed_params
    if @user.valid?
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def allowed_params
    params.require(:user).permit('email', 'name', 'password')
  end
end
