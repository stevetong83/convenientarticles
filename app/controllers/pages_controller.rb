class PagesController < ApplicationController
  def index
    @page_title = "Article Submission Site"
    @articles = Article.search(params[:search], params[:page])
  end

  def about
    @page_title = "About"
  end

end
