class CoursesController < ApplicationController
  before_action :require_user_logged_in

  def show
    @course = Course.find(params[:id])
    @gone_users = @course.gone_users
  end
  
  def new
    @courses = []
        #binding.pry

    @keyword = params[:keyword]
    if @keyword.present?
      results = RakutenWebService::Gora::Course.search({
        keyword: @keyword,
        hits: 20, #取ってくるときの条件付けはここでパラメータを使用する感じ。
      })

      results.each do |result|
        course = Course.find_or_initialize_by(readread(result))
        course.evaluation = result['evaluation']
        #course = Course.find_or_initialize_by(code: result['golfCourseId'],name: result['golfCourseName'],evaluation: result['evaluation'],course_image_url: result['golfCourseImageUrl'])
        
        #course = Course.new(readread(result))
        @courses << course
        #binding.pry
      end
    end
  end
  
  #移動した。application_controllerに。
  

end
