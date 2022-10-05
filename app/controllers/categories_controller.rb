# Renders categories
class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]

  # GET /categories or /categories.json
  def index
    @categories = Category.includes(:published_posts).all
  end

  # GET /categories/1 or /categories/1.json
  def show
    set_posts_for_category
    set_posts_for_category_while_admin if current_admin_user
  end

  private

  def set_category
    @category = Category.find_by!(slug: params[:slug])
  end

  def set_posts_for_category
    @posts = @category.published_posts.page(params[:page])
    @posts = @category.published_posts.search(params[:q]).page(params[:page]) if params[:q].present?
  end

  def set_posts_for_category_while_admin
    @posts = @category.posts.page(params[:page])
    @posts = @category.posts.search(params[:q]).page(params[:page]) if params[:q].present?
  end
end
