require 'rails_helper'
require 'support/utilities'

RSpec.describe "StaticPages", :type => :request do
  @title = ''
  let(:title) { "Ruby on Rails Tutorial Sample App" }

  context "Home page" do
    before { visit root_path }
    it { page.should have_content('Sample App') }
    it { page.should have_title(full_title "Home") }
    it { page.should have_title(full_title) }
  end

  context "About page" do
    before { visit about_path }
    it { page.should have_content('About Us') }
    it { page.should have_title(full_title "About") }
    it { page.should have_title(full_title) }
  end

  context "Help page" do 
    before { visit help_path }
    it { page.should have_content('Help page') }
    it { page.should have_title(full_title) }
    it { page.should have_title(full_title "Help") }
  end

  context "Contacts page" do
    before { visit contacts_path }
    it { page.should have_content("Contacts")}
    it { page.should have_title(full_title) }
    it { page.should have_title(full_title "Contacts") }
  end

end
