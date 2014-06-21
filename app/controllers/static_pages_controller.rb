class StaticPagesController < ApplicationController
  before_action :set_title
  def home
    set_title 'Home'
  end

  def help
    set_title 'Help'
  end

  def about
    set_title 'About'
  end

  def contacts
    set_title 'Contacts'
  end

  private
  def set_title title_name=nil
    @title = "Ruby on Rails Tutorial Sample App"
    @title += " | #{title_name}" if title_name
  end
end
