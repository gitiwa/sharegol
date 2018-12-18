class GonesController < ApplicationController
  def create
    @course = Course.find_or_initialize_by(code: params[:course_code])

    unless @course.persisted?
      # @course が保存されていない場合、先に @course を保存する
      results = RakutenWebService::Gora::Course.search(courseCode: @course.code)

      @course = Course.new(read(results.first))
      @course.save
    end

    # gone 関係として保存
    if params[:type] == 'Gone'
      current_user.gone(@course)
      flash[:success] = 'コースを 「行きたい！！」 しました。'
    end

    redirect_back(fallback_location: root_path)
  end

  def destroy
    @course = Course.find(params[:course_id])

    if params[:type] == 'Gone'
      current_user.ungone(@course) 
      flash[:success] = 'コースを 「行きたい！！」 を解除しました。'
    end

    redirect_back(fallback_location: root_path)
  end
end
