class Project < ApplicationRecord
  has_one_attached :image do |attachable|
    attachable.variant :share, resize_to_limit: [1920, 1080]
  end

  validates :slug, uniqueness: { case_sensitive: false }, presence: true

  before_validation :generate_slug, on: :create

  def generate_slug
    self.slug = name.parameterize unless slug.present?
  end

  def to_param
    slug
  end
end
