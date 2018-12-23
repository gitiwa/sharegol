class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
    #こっちはCourseに登録用。。
  
  def read(result)
    code = result['golfCourseId']
    name = result['golfCourseName']
    
    #detail_url = 'https://booking.gora.golf.rakuten.co.jp/guide/disp/c_id/result['golfCourseId']'
    #detail_url = 'https://booking.gora.golf.rakuten.co.jp/guide/disp/c_id/' + result['golfCourseId'].to_s
    detail_url = 'http://booking.gora.golf.rakuten.co.jp/guide/disp/c_id/' + result['golfCourseId'].to_s
    #detail_url = result['golfCourseDetailUrl']#←ここを考える必要がありそう。
    
    #course_image_url = result['golfCourseImageUrl'] #詳細APIのため一旦Off
    course_image_url = result['golfCourseImageUrl1']#←ここを考える必要がありそう。
    
    address = result['address']
    #caption = result['golfCourseCaption']
    #一度CaptionをOffにしてみる。
    evaluation = result['evaluation']
    
    {
      code: code,
      name: name,
      detail_url: detail_url,
      course_image_url: course_image_url,
      address: address,
      #caption: caption,
      evaluation: evaluation
    }
  end
  
  #もう一つメソッドを作成してみた。検索後の表示用。
    def readread(result)
    code = result['golfCourseId']
    name = result['golfCourseName']
    
    detail_url = result['golfCourseDetailUrl']
    
    course_image_url = result['golfCourseImageUrl'] 
    
    address = result['address']
    #caption = result['golfCourseCaption']
    #一度CaptionをOffにしてみる。
    #evaluation = result['evaluation']
    
    {
      code: code,
      name: name,
      detail_url: detail_url,
      course_image_url: course_image_url,
      address: address,
      #caption: caption,
      #evaluation: evaluation
    }
  end
  
end
