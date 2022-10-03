class Category < ApplicationRecord
  has_many :post_categories, dependent: :destroy
  has_many :posts, through: :post_categories

  has_many :published_posts, -> { where(published: true) }, through: :post_categories, source: :post

  validates :slug, uniqueness: { case_sensitive: false }, presence: true

  before_validation :generate_slug, on: :create

  def generate_slug
    self.slug = name.parameterize unless slug.present?
  end

  def to_param
    slug
  end
end
