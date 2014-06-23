require 'rails_helper'

RSpec.describe "StaticPages", :type => :request do
  @title = ''
  let(:title) { "Ruby on Rails Tutorial Sample App" }

  context "Home page" do
    it "It should have content 'Sample App'" do
      visit root_path
      expect(page).to have_content('Sample App')
    end

  end
  describe "GET /static_pages" do
    it "should have a Help content" do
      visit help_path
      expect(page).to have_content('Help page')
    end

    describe "About page" do
      it "should have content 'About Us'" do
        visit about_path
        expect(page).to have_content('About Us')
      end
    end

    describe "Contacts page" do
      it "should have content 'Contacts'" do
        visit contacts_path
        expect(page).to have_content("Contacts")
        expect(page).to have_title(@title)
        expect(page).to have_title("#{@title} | Contacts")
      end
    end
  end

  describe "All pages must have a title" do
    it 'About page should have a title' do
      visit about_path
      expect(page).to have_title(@title)
    end
    
    it 'About page should have a specified title' do
      visit about_path
      expect(page).to have_title("#{@title} | About")
    end
    
    it 'Home page should have a specified title' do
      visit root_path
      expect(page).to have_title("#{@title} | Home")
    end
    
    it 'Home page should have a title' do
      visit root_path
      expect(page).to have_title(@title)
    end

    it 'Help page should have a title' do
      visit help_path
      expect(page).to have_title(@title)
    end
    
    it 'Help page should have a title' do
      visit help_path
      expect(page).to have_title("#{@title} | Help")
    end
  end
end
