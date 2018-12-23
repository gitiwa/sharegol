class User < ApplicationRecord
  
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  
  has_many :wents
  has_many :courses, through: :wents
  #あってる
  
  has_many :gones
  has_many :gone_courses, through: :gones, source: :course
  #あってる
  
  
  def gone(course)
    self.gones.find_or_create_by(course_id: course.id)
  end

  def ungone(course)
    gone = self.gones.find_by(course_id: course.id)
    gone.destroy if gone
  end

    #以下変更中1222
  def gone?(course)
    self.gone_courses.include?(course)
    #binding.pry
    
   # self.gone_courses.each do |goneCourse|
    
    #binding.pry
    
    #  if goneCourse.code == course.code
    #  return true
    #  end
    #end
    #return false
  end

has_secure_password
end
