class Project < ApplicationRecord
  validates :slug, uniqueness: { case_sensitive: false }

  def generate_slug
    self.slug = name.parameterize unless slug.present?
  end

  def to_param
    slug
  end
end
