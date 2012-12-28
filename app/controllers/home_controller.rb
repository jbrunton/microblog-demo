class HomeController < ApplicationController
  def index
    @bleats = Bleat.order('created_at DESC').limit(10)
    @trending_tags = HashTag.trending
  end
  
  def welcome
  end
end
