class PagesController < ApplicationController
  def about
    @user = AdminUser.find_by(about_page: true)
  end

  def home
    @posts = Post.includes(:tags).where(published: true).order(published_date: :desc).page(params[:page])
    @posts = Post.includes(:tags).page(params[:page]) if current_admin_user
  end

  def sitemap
    @tags = Tag.all
    @posts = Post.where(published: true).order(published_date: :desc)
  end
end
