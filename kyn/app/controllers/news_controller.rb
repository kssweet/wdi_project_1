class NewsController < ActionController::Base

  include NytimesHelper

  def index
    @articles = NYTimes.retrieve_articles
  end

  def show
  end

  def new
    @articles = articles.new
  end

end
