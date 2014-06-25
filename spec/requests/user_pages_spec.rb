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
        expect( click_button submit ).not_to change(User, :count)
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
        expect( click_button submit ).to change(User, :count)
      end

    end

  end
end
