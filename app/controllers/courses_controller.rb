class CoursesController < ApplicationController
  before_action :require_user_logged_in

  def new
    @courses = []

    @keyword = params[:keyword]
    if @keyword.present?
      results = RakutenWebService::Gora::Course.search({
        keyword: @keyword,
        hits: 20, #取ってくるときの条件付けはここでパラメータを使用する感じ。
      })

      results.each do |result|
        course = Course.new(read(result))
        @courses << course
      end
    end
  end
  
  #以下確認が必要
    private

  def read(result)
    code = result['golfCourseId']
    name = result['golfCourseName']
    detail_url = result['golfCourseDetailUrl']
    course_image_url = result['golfCourseImageUrl']
    address = result['address']
    captiorn = result['golfCourseCaption']
    evaluation = result['evaluation']
    
    {
      code: code,
      name: name,
      detail_url: detail_url,
      course_image_url: course_image_url,
      address: address,
      captiorn: captiorn,
      evaluation: evaluation
    }
  end
  
end
