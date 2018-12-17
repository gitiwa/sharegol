class Course < ApplicationRecord
  validates :code, presence: true, length: { maximum: 255 }
  validates :name, presence: true, length: { maximum: 255 }
  validates :detail_url, presence: true, length: { maximum: 255 }
  validates :course_image_url, presence: true, length: { maximum: 255 }
  validates :address, presence: true, length: { maximum: 255 }
  validates :captiorn, presence: true, length: { maximum: 255 }
end
