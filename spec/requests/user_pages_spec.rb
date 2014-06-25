require 'rails_helper'

RSpec.describe "UserPages", :type => :request do
  subject { page }
  describe "View page" do
    before { visit signup_path }
    it { should have_content("Sign up now") }
    it { should have_title(full_title "Sign up") }
  end

  describe "profile page"do
    before { visit user_path(user) }

    let(:user) { FactoryGirl.create(:user) }
    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end

end
