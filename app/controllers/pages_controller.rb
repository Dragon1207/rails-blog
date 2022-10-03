class PagesController < ApplicationController
  def about
    @user = AdminUser.find_by(about_page: true)
  end

  def home
    @posts = Post.includes(:categories).where(published: true).order(published_date: :desc).page(params[:page])
    @posts = Post.includes(:categories).page(params[:page]) if current_admin_user
    @categories = Category.all.order("id")
  end

  def sitemap
    @categories = Category.all
    @posts = Post.where(published: true).order(published_date: :desc)
  end
end
