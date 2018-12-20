class Gone < Went
  def self.ranking
    self.group(:course_id).order('count_course_id DESC').limit(10).count(:course_id)
  end
end
