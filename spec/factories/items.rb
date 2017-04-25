# spec/factories/items.rb
FactoryGirl.define do
  factory :item do
    name { Faker::StarWars.character }
    done false
    student_id nil
  end
end