FactoryGirl.define do
  factory :user do
    name "test"
    email "test@example.com"
    password "password"
    password_confirmation "password"
    password_digest { User.digest('password') }
    factory :invalid_user do
      password_confirmation "blabla"
    end
    factory :nonexistent_user do
      email "ffsdfs@ffsdfs.com"
    end
  end
end
