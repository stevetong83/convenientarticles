class PagesController < ApplicationController
  def index
    @page_title = "Article Submission Site"
    @articles = Article.paginate :page => params[:page],
                                :per_page => 6,
                                :conditions => ['title like ?', "%#{params[:search]}%"],
                                :order => "created_at DESC"
  end

  def about
    @page_title = "About"
  end

end
