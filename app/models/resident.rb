class Resident < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :favorites, dependent: :destroy
  has_many :favorite_interiors, through: :favorites, source: :interior
  has_many :contracts, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :rooms, dependent: :destroy

  validates :name, presence: true
  validates :user_name, presence: true
  validates :sex, presence: true
  validates :birthday, presence: true

  mount_uploader :profile_img, ImageUploader
  enum sex: { male: 1, female: 2, undisclosed: 3 }
end
