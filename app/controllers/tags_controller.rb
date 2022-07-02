# Renders tags
class TagsController < ApplicationController
  before_action :set_tag, only: [:show]

  # GET /tags or /tags.json
  def index
    @tags = Tag.includes(:published_posts).all
  end

  # GET /tags/1 or /tags/1.json
  def show
    set_posts_for_tag
    set_posts_for_tag_while_admin if current_admin_user
  end

  private

  def set_tag
    @tag = Tag.find_by!(slug: params[:slug].downcase)
  end

  def set_posts_for_tag
    @posts = @tag.published_posts.page(params[:page])
    @posts = @tag.published_posts.search(params[:q]).page(params[:page]) if params[:q].present?
  end

  def set_posts_for_tag_while_admin
    @posts = @tag.posts.page(params[:page])
    @posts = @tag.posts.search(params[:q]).page(params[:page]) if params[:q].present?
  end
end
