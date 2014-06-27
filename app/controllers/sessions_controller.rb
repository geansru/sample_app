class SessionsController < ApplicationController
  def new
    @title  = "Sign in"
    @sign   = User.new
  end

  def create
    user = User.find_by email: params[:user][:email] if params[:user][:email]

    if user and user.authenticate(params[:user][:password])
      signin user 
      redirect_to user_path(user), notice: "Вы успешно выполнили вход!"
    else
      redirect_to signin_path, alert: "Не правильные имя пользователя и/или пароль"
    end
  end

  def  destroy
    signout
    redirect_to root_path
  end

  private
  def signin user
    session[:auth] = true                                                                                           
    session[:id] = user.id
  end
  def signout
    session[:auth] = nil
    session[:id]   = nil
  end
end
