require 'rails_helper'

RSpec.describe User, :type => :model do
  before { @user = User.create(name: 'Example User', email: "dm@mail.ru", password: '123456789', password_confirmation: '123456789') }
  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }

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

  context "User password" do
    context "not present" do
      before { @user.password = @user.password_confirmation = '' }
      it { should_not be_valid}
    end

    context "don't match with confirmation" do
      before { @user.password_confirmation = '' }
      it { should_not be_valid}
    end

    context "return value of authentication method" do
      before { @user.save }
      let(:found_user) { User.find_by( email: @user.email ) }

      context "with valid password" do
        it { should eq found_user.authenticate(@user.password) }
      end

      context "with invalid password" do
        let(:denied_user) { found_user.authenticate('missmatch') }
        it { should_not eq denied_user }
#        it { expect(denied_user).to be_false }
      end

      context "too short" do
        before { @user.password = @user.password_confirmation = 'a'*5 }
        it { should be_invalid }
      end
    end

  end

end
