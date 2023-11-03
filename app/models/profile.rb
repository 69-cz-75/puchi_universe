class Profile < ApplicationRecord
  belongs_to :user

  enum gender: { male: 0, female: 1, other: 2, prefer_not_to_say: 3 }

  validates :name, presence: true
  validates :birthdate, presence: true
  validates :gender, presence: true
end
