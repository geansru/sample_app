class UsersController < ApplicationController
  before_action :set_title
  def new
    @user = User.new
    set_title "Sign up"
  end

  def show
    @user = User.find params[:id]
    set_title @user.name
  end

  def create
    set_title "Sign up"
    @user = User.new permit_params
    if @user.save
      flash[:success] = "Добро пожаловать!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @title = "Редактировать профиль"
    @user = User.find params[:id] 
#    if session[:id]
#      @user = User.find session[:id]
#    else
#      redirect_to signin_path
#    end
  end

  def update
    @user = User.find params[:id]
    success = true
    params[:user].each do |k,v|
      unless v.chomp.empty?
        success = false unless @user.update_attribute k.to_sym, v
      end
    end

    if success #@user.update(permit_params)
      redirect_to user_path(@user)
    else
       render 'edit'
    end
  end
  private
  def set_title custom=nil
    @title = "Ruby on Rails Tutorial Sample App"
    @title += " | " + custom if custom
    @title 
  end

  def permit_params
    params.require(:user).permit( :name, :email, :password, :password_confirmation )
  end
end
