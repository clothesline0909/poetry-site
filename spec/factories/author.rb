FactoryGirl.define do
  factory :author do
    sequence(:name) { |n| "Name #{n}"}
    biography "Biography"
  end
end