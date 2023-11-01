FactoryBot.define do
  factory :profile do
    name { "john" }
    gender { "male" }
    birthdate { Date.new(2012, 1, 2) }
  end
end
