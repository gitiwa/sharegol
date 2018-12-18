class ToppagesController < ApplicationController
  def index
     @courses = Course.order('updated_at DESC')
  end
end
