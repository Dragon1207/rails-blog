# Renders tags
class TagsController < ApplicationController
  before_action :set_tag, only: [:show]

  # GET /tags or /tags.json
  def index
    @tags = Tag.includes(:posts).all
  end

  # GET /tags/1 or /tags/1.json
  def show; end

  private

  def set_tag
    @tag = Tag.find_by!(slug: params[:slug].downcase)
  end
end
