# Renders blog posts
class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  private

  def set_post
    @post = Post.find_by!(slug: params[:slug])
  end
end
