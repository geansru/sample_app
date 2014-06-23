require 'rails_helper'
require 'support/utilities'

RSpec.describe "StaticPages", :type => :request do
  @title = ''
  let(:title) { "Ruby on Rails Tutorial Sample App" }
  subject { page }
  context "Home page" do
    before { visit root_path }
    it { should have_content('Sample App') }
    it { should have_selector('h2', 'Sample App') }
    it { should have_title(full_title "Home") }
    it { should have_title(full_title) }
  end

  context "About page" do
    before { visit about_path }
    it { should have_content('About Us') }
    it { should have_selector('h2', 'About Us') }
    it { should have_title(full_title "About") }
    it { should have_title(full_title) }
  end

  context "Help page" do 
    before { visit help_path }
    it { should have_content('Help page') }
    it { should have_selector('h2', 'Help page') }
    it { should have_title(full_title) }
    it { should have_title(full_title "Help") }
  end

  context "Contacts page" do
    before { visit contacts_path }
    it { should have_content("Contacts")}
    it { should have_selector('h2', text: "Contacts") }
    it { should have_title(full_title) }
    it { should have_title(full_title "Contacts") }
  end

end
