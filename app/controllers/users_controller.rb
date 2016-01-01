class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new allowed_params
    if @user.save
      redirect_to root_path, notice: "Account created successfully!"
    else
      render :new
    end
  end

  private

  def allowed_params
    params.require(:user).permit('email', 'name', 'password')
  end
end
