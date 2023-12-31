FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user_#{n}@example.com" }
    password { "password" }
      # profileのファクトリを作成するときに関連づける
    profile { association :profile, user: instance } # user: instance で循環参照を避ける
  end
end
