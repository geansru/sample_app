class UsersController < ApplicationController
  before_action :set_title
  def new
    set_title "Sign up"
  end

  def set_title custom=nil
    @title = "Ruby on Rails Tutorial Sample App"
    @title += " | " + custom if custom
    @title 
  end
end
