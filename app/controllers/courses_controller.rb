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
        course = Course.new(readread(result))
        @courses << course
      end
    end
  end
  
  #移動した。application_controllerに。
  
  
  def show
    @course = Course.find(params[:id])
    @gone_users = @course.gone_users
  end
  
end
