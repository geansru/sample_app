require 'rails_helper'

RSpec.describe "UserPages", :type => :request do
  subject { page }
  describe "View page" do
    before { visit signup_path }
    it { should have_content("Sign up now") }
    it { should have_title(full_title) }
    it { should have_title(full_title "Sign up") }
#    it { expect(response.status).to be(200) }

  end
end
