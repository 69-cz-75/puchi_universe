class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  has_many :scene_photos
  has_many :scale_comparison_photos

  accepts_nested_attributes_for :profile

  def owns_scene_photo?(scene_photo)
    scene_photo.user == self
  end
end
