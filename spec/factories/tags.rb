FactoryBot.define do
  FactoryBot.define do
    factory :tag do
      sequence(:name) { |n| "Tag #{n}" }
    end
  end
end
