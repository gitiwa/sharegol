class WentsController < ApplicationController

  def create
    @course = Course.find_or_initialize_by(code: params[:course_code])
    
    #binding.pry
    
    unless @course.persisted?
      # @course が保存されていない場合、先に @course を保存する
      # 下記はidによる検索はできないので、RakutenWebService::Gora::CourseDetailの導線を設定してあげる必要があります。
      
      #results = RakutenWebService::Gora::Course.search(courseCode: @course.code)
      #@course = Course.new(read(results.first))
     
      #お試しでOff
      
      results_results = RakutenWebService::Gora::CourseDetail.search(golfCourseId: @course.code)
      @course = Course.new(read(results_results.first))
      
      #binding.pry
      
      @course.save
    end

    # gone 関係として保存
    if params[:type] == 'Gone'
      current_user.gone(@course)
      flash[:success] = 'コースを 「行きたい！！」 しました。　　　　※※コース上のボタンが切り替わらない場合があるため、マイページも併せてご確認ください。'
    end

    redirect_back(fallback_location: root_path)
  end

  def destroy
    #@course = Course.find(params[:course_code])#course_idを変更してみる。
    @course = Course.find(params[:course_id])
    #@course = Course.find(params[:id])


    if params[:type] == 'Gone'
      current_user.ungone(@course) 
      flash[:success] = 'コースを 「行きたい！！」 を解除しました。　　　　※※コース上のボタンが切り替わらない場合があるため、マイページも併せてご確認ください。'
    end

    redirect_back(fallback_location: root_path)
  end
end
