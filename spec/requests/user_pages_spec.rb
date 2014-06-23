require 'rails_helper'

RSpec.describe "UserPages", :type => :request do
  describe "View page" do
    before { visit signup_path }
    it { page.should have_content("Sign up now") }
#    it { expect(response.status).to be(200) }

  end
end
