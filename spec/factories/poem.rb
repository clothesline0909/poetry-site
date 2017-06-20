FactoryGirl.define do
  factory :poem do
    sequence(:title) { |n| "Title #{n}"}
    author
    year "Year"
    text "Text"
  end
end