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
    @user = User.new permit_params
    if @user.save
      flash[:success] = "Добро пожаловать!"
      redirect_to @user
    else
      
      render 'new'
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
