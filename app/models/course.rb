class Course < ApplicationRecord
  validates :code, presence: true, length: { maximum: 255 }
  validates :name, presence: true, length: { maximum: 255 }
  validates :detail_url, presence: true, length: { maximum: 255 }
  validates :course_image_url, presence: true, length: { maximum: 255 }
  validates :address, presence: true, length: { maximum: 255 }
  #validates :caption, presence: true, length: { maximum: 255 }
  
  has_many :wents
  has_many :users, through: :wents
  
  has_many :gones
  has_many :gone_users, through: :gones, source: :user
  
end
