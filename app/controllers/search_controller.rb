class SearchController < ApplicationController
  def index
    query = params[:q].downcase
    @title = "Results for <b>#{query}</b>".html_safe
    begin
      @bleats = Bleat.search_for(query, :load => true)
    rescue
      logger.warn "Unable to search with elasticsearch. Searching with ActiveRecord instead."
      @bleats = Bleat.where("lower(content) LIKE ?", "%#{query}%")
    end
    render :template => 'search/results'
  end
end
