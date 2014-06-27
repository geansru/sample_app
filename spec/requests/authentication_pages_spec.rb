require 'rails_helper'

RSpec.describe "Authentication", :type => :request do
  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_content("Sign in") }
    it { should have_title("Sign in") }

    context "failed logon" do
      before { click_button "Sign in" }

      it { should have_title("Sign in") }
      it { should have_selector('div.alert.alert-danger') }
    end

    context "success logon" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "user_email",    with: user.email
        fill_in "user_password", with: user.password

        click_button "Sign in"
      end

      it { should   have_title(user.name) }
      it { should     have_link('Profile',  href: user_path(user)) }
      it { should     have_link('Sign out', href: signout_path) }
      it { should_not have_link('Sign in',  href: signin_path) }

      context "followed by signout" do
        before { click_link "Sign out" }
        it { should have_link('Sign in') }
      end

    end
  end
end
