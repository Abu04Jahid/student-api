# spec/factories/todos.rb
FactoryGirl.define do
  factory :student do
    student_name { Faker::Lorem.word }
    roll { Faker::Number.number(10) }
  end
end