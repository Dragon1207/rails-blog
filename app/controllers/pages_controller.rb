class PagesController < ApplicationController
  def about
  end

  def home
    @posts = Post.includes(:tags).where(published: true).order(published_date: :desc)
    @posts = Post.includes(:tags).all if current_admin_user
  end
end
