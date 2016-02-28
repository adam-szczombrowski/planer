FactoryGirl.define do
  factory :user do |f|
    f.name "John"
    f.email "john@example.com"
    f.password "12345678"
  end
end
