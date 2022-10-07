class PagesController < ApplicationController

  def about
    @user = AdminUser.find_by(about_page: true)
  end

  def home
    @posts = Post.includes(:categories).where(published: true).order(published_date: :desc).page(params[:page])
    @posts = Post.includes(:categories).page(params[:page]) if current_admin_user
    @categories = Category.all.order("id")
  end

  def show
    @categories = Category.all.order("id")
    if params[:slug] == 'all'
      @current_category = 'all'
      @posts = Post.includes(:categories).where(published: true).order(published_date: :desc).page(params[:page])
      @posts = Post.includes(:categories).page(params[:page]) if current_admin_user
    else
      @category = Category.find_by!(slug: params[:slug])
      @current_category = Category.find_by(slug: params[:slug]).name
      set_posts_for_category
      set_posts_for_category_while_admin if current_admin_user
    end
    cates = []
    @posts.each do |post|
      post_cates = []
      post.categories.each do |category|
        post_cates.append('id': category.id, 'name': category.name , 'slug': category.slug)
      end
      cates.append(post_cates)
    end
    render :json => {categories: @categories, current_category: @current_category, posts: @posts, cates: cates}
  end

  def set_posts_for_category
    @posts = @category.published_posts.page(params[:page])
    @posts = @category.published_posts.search(params[:q]).page(params[:page]) if params[:q].present?
  end

  def set_posts_for_category_while_admin
    @posts = @category.posts.page(params[:page])
    @posts = @category.posts.search(params[:q]).page(params[:page]) if params[:q].present?
  end

  def sitemap
    @categories = Category.all
    @posts = Post.where(published: true).order(published_date: :desc)
  end
end
