class Tag < ApplicationRecord
  has_many :post_tags, dependent: :destroy
  has_many :posts, through: :post_tags

  has_many :published_posts, -> { where(published: true) }, through: :post_tags, source: :post

  validates :slug, uniqueness: { case_sensitive: false }, presence: true

  before_validation :generate_slug, on: :create

  def generate_slug
    self.slug = name.parameterize unless slug.present?
  end

  def to_param
    slug
  end
end
