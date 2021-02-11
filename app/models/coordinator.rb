class Coordinator < ApplicationRecord
  has_many :interiors
  has_many :contracts
  has_many :requests
  has_many :rooms
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :profile_img, ImageUploader
  enum sex: { male: 1, female: 2, undisclosed: 3 }
end
