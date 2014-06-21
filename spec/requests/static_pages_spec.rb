require 'rails_helper'

RSpec.describe "StaticPages", :type => :request do
  describe "GET /static_pages" do
    it "It should have content 'Sample App'" do
      visit static_pages_home_path
      expect(page).to have_content('Sample App')
    end
    it "should have a Help content" do
      visit static_pages_help_path
      expect(page).to have_content('Help page')
    end

    describe "About page" do
      it "should have content 'About Us'" do
        visit static_pages_about_path
        expect(page).to have_content('About Us')
      end
    end

    describe "Contacts page" do
      it "should have content 'Contacts'" do
        visit static_pages_contacts_path
        expect(page).to have_content("Contacts")
        expect(page).to have_title("Ruby on Rails Tutorial Sample App")
        expect(page).to have_title("Ruby on Rails Tutorial Sample App | Contacts")
      end
    end
  end

  describe "All pages must have a title" do
    it 'About page should have a title' do
      visit static_pages_about_path
      expect(page).to have_title("Ruby on Rails Tutorial Sample App")
    end
    
    it 'About page should have a specified title' do
      visit static_pages_about_path
      expect(page).to have_title("Ruby on Rails Tutorial Sample App | About")
    end
    
    it 'Home page should have a specified title' do
      visit static_pages_home_path
      expect(page).to have_title("Ruby on Rails Tutorial Sample App | Home")
    end
    
    it 'Home page should have a title' do
      visit static_pages_home_path
      expect(page).to have_title("Ruby on Rails Tutorial Sample App")
    end

    it 'Help page should have a title' do
      visit static_pages_help_path
      expect(page).to have_title("Ruby on Rails Tutorial Sample App")
    end
    
    it 'Help page should have a title' do
      visit static_pages_help_path
      expect(page).to have_title("Ruby on Rails Tutorial Sample App | Help")
    end
  end
end
