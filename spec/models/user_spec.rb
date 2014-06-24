require 'rails_helper'

RSpec.describe User, :type => :model do
  before { @user = User.create(name: 'Example User', email: "dm@mail.ru") }
  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }

  context "When name is not present" do
    before { @user = User.create }
    it { should_not be_valid }
  end

  context "Email" do
    context "When email is not present" do
      before { @user = User.create }
      it { should_not be_valid }
    end
  
    context "When name is too long" do
      before { @user.name = 'a'*51 }
      it { should_not be_valid }
    end

    context "When name is too short" do
      before { @user.name = 'a'*3 }
      it { should_not be_valid }
    end

    context "when email format is invalid" do
      it "should be invalid"  do
        addresses = %w[ user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
        
        addresses.each do |a|
          @user.email = a
          expect(@user).not_to be_valid
        end

      end
    end

    context "when email format is valid" do
      it "should be valid" do
        addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
        
        addresses.each do |a|
          @user.email = a
          expect(@user).to be_valid
        end

      end
    end

    context "when email is alredy taken" do
      before do 
        @user_dup = @user.dup
        @user_dup.email = @user_dup.email.upcase
        @user_dup.save
      end
      subject { @user_dup }

      it { should_not be_valid }

    end

  end
end
