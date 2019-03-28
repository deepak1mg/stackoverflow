FactoryBot.define do
  factory :user do
    name { "John" }
    email  { "john@gmail.com" }
    password {"secret"}
    id {1}
  end
end