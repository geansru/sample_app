require 'rails_helper'

RSpec.describe "UserPages", :type => :request do
  subject { page }
  describe "View page" do
    before { visit signup_path }
    it { should have_content("Присоединяйтесь к нам") }
    it { should have_title(full_title "Sign up") }
  end

  describe "profile page"do
    before { visit user_path(user) }

    let(:user) { FactoryGirl.create(:user) }
    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end

  context "signup page" do
    before { visit signup_path }
    let(:submit) { "OK" }

    context "with invalid information" do
      it "should not create a user" do
        expect { click_button(submit) }.not_to change(User, :count)
      end

      context "after submission" do
        before { click_button submit }
        it { should have_title(full_title "Sign up") }
        it { should have_content("Ошибка") }
      end

    end

    context "with valid information" do

      before do
        fill_in "user_name",         with: "Example User"
        fill_in "user_email",        with: "example@mail.com"
        fill_in "user_password",     with: "foobar123"
        fill_in "user_password_confirmation", with: "foobar123"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count)
      end

      context "after saving user" do
        before { click_button submit }
        let(:user) { User.find_by email: "example@mail.com" }

        it { should have_title(user.name) }
        it { should have_selector("div.alert.alert-success") }
      end

    end

  end

  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      visit edit_user_path(user) 
    end

    context "page" do
      it { should have_content("Редактировать профиль") }
      it { should have_title("Редактировать профиль") }
      it { should have_link('change', href: 'http://gravatar.com/emails') } 
    end

    context "with invalid information" do
      before { click_button "Сохранить" }

      it { should have_content('error') }
    end
  end

end
