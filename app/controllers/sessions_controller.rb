class SessionsController < ApplicationController
  def new
    @user=User.new
  end
  def create
    @user= User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
        session[:user_id]=@user.id
        redirect_to "/"
    elsif @user==nil
        alert = "Email or password is incorrect"
    else
      flash[:alert] = "Wrong Password or email id"          
      redirect_to login_path
    end
  end
  def omniauth
    user=User.find_or_create_by(uid: request.env['omniauth.auth'][:uid], provider: request.env['omniauth.auth'][:provider]) do |u|
      u.email=request.env['omniauth.auth'][:info][:email]
      u.password=SecureRandom.hex(15)
    end
    if user
      session[:user_id]=user.id
      redirect_to "/"
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id]=nil
    redirect_to '/login'
  end
end
