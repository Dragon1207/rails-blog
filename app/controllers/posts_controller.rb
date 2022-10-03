# Renders blog posts
class PostsController < ApplicationController
  include ActiveStorage::SetCurrent
  before_action :set_post, only: [:show]

  # GET /posts or /posts.json
  def index
    set_posts
    set_posts_if_admin if current_admin_user
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  private

  def set_post
    @post = Post.includes(:categories).where(published: true).find_by(slug: params[:slug].downcase)
    @post = Post.includes(:categories).find_by!(slug: params[:slug].downcase) if current_admin_user
    return if @post

    raise ActiveRecord::RecordNotFound, "Couldn't find Post with url #{params[:slug]}"
  end

  def set_posts
    @posts = Post.includes(:categories).where(published: true).order(published_date: :desc).page(params[:page])
    @posts = Post.includes(:categories).where(published: true).search(params[:q]).page(params[:page]) if params[:q].present?
  end

  def set_posts_if_admin
    @posts = Post.includes(:categories).all.order(published_date: :desc).page(params[:page])
    @posts = Post.includes(:categories).search(params[:q]).page(params[:page]) if params[:q].present?
  end
end
