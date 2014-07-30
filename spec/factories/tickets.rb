# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ticket do
    sequence(:name) { |n| "My Ticket #{n}" }
    client "My Client"
    archived false
  end
end
