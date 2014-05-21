class NewsController < ActionController::Base

  include NytimesHelper

  def new
  end

  def index
    @articles = NYTimes.retrieve_articles
  end

  def show
  end




end
