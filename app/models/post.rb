class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  def published?
    is_published
  end

  scope :published, -> { where(is_published: true) }
end
