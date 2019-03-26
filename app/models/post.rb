class Post < ApplicationRecord
  extend FriendlyId
  include PgSearch

  friendly_id :title, use: :slugged

  def published?
    is_published
  end

  scope :published, -> { where(is_published: true).order('id DESC') }

  pg_search_scope :search_for,
    against: %i(title content),
    using: {
      tsearch: {
        prefix: true,
        negation: true
      }
    }

  KINDS = ['default', 'bookmark', 'secure']
  validates :kind, presence: true
  validates :kind, inclusion: { in: KINDS }

  before_save :encrypt_secure_posts


  def encrypt_secure_posts(enc_key)
  end
end
