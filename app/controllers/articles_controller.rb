class ArticlesController < ApplicationController
  before_filter :authenticate_user!, :except => :show
  load_and_authorize_resource :only => [:edit, :update, :destroy]

  def index
    @article = Article.all
  end

  def new
    @article = Article.new
    @page_title = "Write a new article"
  end

  def create
    @article = current_user.articles.build params[:article]
    if @article.save
      flash[:notice] = "Article has been created successfully"
      redirect_to root_path
    else
      render :action => 'new'
    end
  end

  def show
    @article = Article.find params[:id]
  end


  def edit
    @page_title = "Edit your article"


  end

  def update
    @article = Article.find params[:id]
    @article.update_attributes params[:article]
    if @article.save
      redirect_to @article
    else
      render "edit"
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article has been successfully deleted"
    redirect_to current_user

  end
end
