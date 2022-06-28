class Post < ApplicationRecord
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_rich_text :content

  has_one_attached :social_image do |attachable|
    attachable.variant :twitter, resize_to_limit: [2000, 2000]
    attachable.variant :facebook, resize_to_limit: [1200, 630]
  end

  validates :slug, uniqueness: { case_sensitive: false }, presence: true

  before_validation :generate_slug, on: :create

  def generate_slug
    self.slug = name.parameterize if slug.empty?
  end

  def to_param
    slug
  end
end
