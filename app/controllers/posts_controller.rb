# Renders blog posts
class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  # GET /posts or /posts.json
  def index
    @posts = Post.includes(:tags).where(published: true).order(published_date: :desc).page(params[:page])
    @posts = Post.includes(:tags).all.order(published_date: :desc).page(params[:page]) if current_admin_user
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  private

  def set_post
    @post = Post.includes(:tags).where(published: true).find_by(slug: params[:slug].downcase)
    @post = Post.find_by!(slug: params[:slug].downcase) if current_admin_user
    return if @post

    raise ActiveRecord::RecordNotFound, "Couldn't find Post with url #{params[:slug]}"
  end
end
