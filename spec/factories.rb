FactoryGirl.define do
  factory :user do
    name     "Michael Hartl"
    email    "example@railstutorial.org"
    password "foobar123"
    password_confirmation "foobar123"
  end
end
