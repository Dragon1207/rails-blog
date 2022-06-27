class Post < ApplicationRecord
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_rich_text :content

  validates :slug, uniqueness: { case_sensitive: false }

  def generate_slug
    self.slug = name.parameterize unless slug.present?
  end

  def to_param
    slug
  end
end
