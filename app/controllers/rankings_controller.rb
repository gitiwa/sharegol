class RankingsController < ApplicationController
  def gone
    
    @ranking_counts = Gone.ranking
    @courses = Course.find(@ranking_counts.keys)
    
  end
end
