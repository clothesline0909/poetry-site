FactoryGirl.define do
  factory :author do
    sequence(:name) { |n| "Name #{n}"}
    sequence(:biography) { |n| "Biography #{n}"}
  end
end