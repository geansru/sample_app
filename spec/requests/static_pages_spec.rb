require 'rails_helper'
require 'support/utilities'

RSpec.describe "StaticPages", :type => :request do
  @title = ''
  let(:title) { "Ruby on Rails Tutorial Sample App" }
  subject { page }

  shared_examples_for "all static pages" do
    it { should have_content(content) }
    it { should have_selector('h2', text: content) }
    it { should have_title(full_title title) }
    it { should have_title(full_title) }
  end
  context "Home page" do
    before { visit root_path }
    let(:content) { 'Sample App' }
    let(:title) { "Home" }

    it_should_behave_like "all static pages"
  end

  context "About page" do
    before { visit about_path }

    let(:content) { 'About Us' }
    let(:title) { "About"  }
    it_should_behave_like "all static pages"
  end

  context "Help page" do 
    before { visit help_path }
    let(:content) { 'Help page' }
    let(:title) { 'Help' }
    it_should_behave_like "all static pages"
  end

  context "Contacts page" do
    before { visit contacts_path }
    let(:content) { "Contacts" }
    let(:title) { "Contacts" }
    it_should_behave_like "all static pages"
  end

  context "Layout navigation" do
    it "should have valid  links on the layout" do
      visit root_path
      click_link "About"
      expect(page).to have_title(full_title("About"))

      click_link "Help"
      expect(page).to have_title(full_title("Help"))

      click_link "Contacts"
      expect(page).to have_title(full_title("Contacts"))

      click_link "Sign up"
      expect(page).to have_content("Sign up now")

      click_link "Sample App"
      expect(page).to have_title(full_title("Home"))
    end
  end
end
