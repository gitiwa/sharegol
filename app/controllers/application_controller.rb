class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  
  def read(result)
    code = result['golfCourseId']
    name = result['golfCourseName']
    detail_url = result['golfCourseDetailUrl']
    course_image_url = result['golfCourseImageUrl']
    address = result['address']
    caption = result['golfCourseCaption']
    evaluation = result['evaluation']
    
    {
      code: code,
      name: name,
      detail_url: detail_url,
      course_image_url: course_image_url,
      address: address,
      caption: caption,
      evaluation: evaluation
    }
  end
  
end
