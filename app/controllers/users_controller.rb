class UsersController < ApplicationController
  def new
    @user= User.new
  end
  def create
    @user=User.create(user_params)
    if @user.valid?
      @user.save
      session[:user_id]=@user.id
      redirect_to "/"
    else
      flash[:alert] =@user.errors.full_messages
      redirect_to '/signup'
    end
  end

    

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :admin)
  end
end
