class PagesController < ApplicationController
  def index
    @page_title = "Article Submission Site"
    @articles = Article.paginate :page => params[:page],
                                :per_page => 10,
                                :order => "created_at DESC"
  end

  def about
    @page_title = "About"
  end

  def contact
    @page_title = "Contact"
  end
end
