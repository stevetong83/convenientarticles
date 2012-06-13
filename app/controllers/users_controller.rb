class UsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource :except => :show

  def index
    @users = User.paginate :page => params[:page],
                            :per_page => 30,
                            :order => "created_at DESC"
  end

  def show
    @user = User.find params[:id]
    @articles = @user.articles.paginate :page => params[:page],
                                       :per_page => 20,
                                       :order => "created_at DESC"
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    redirect_to root_path
  end
end
