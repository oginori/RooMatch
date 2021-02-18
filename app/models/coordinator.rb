class Coordinator < ApplicationRecord
  has_many :interiors, dependent: :destroy
  has_many :contracts, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :rooms, dependent: :destroy
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :profile_img, ImageUploader
  enum sex: { male: 1, female: 2, undisclosed: 3 }
end
