class Post < ApplicationRecord
  extend FriendlyId
  include PgSearch::Model

  friendly_id :title, use: :slugged
  scope :published, -> { where(is_published: true).order('id DESC') }

  pg_search_scope :search_for,
    against: %i(title content),
    using: {
      tsearch: {
        prefix: true,
        negation: true
      }
    }

  KINDS = %w[default bookmark secure].freeze

  validates :kind, presence: true
  validates :kind, inclusion: { in: KINDS }

  belongs_to :user, counter_cache: true

  scope :articles, -> { where(kind: 'default') }
  scope :bookmarks, -> { where(kind: 'bookmark') }
  scope :secrets, -> { where(kind: 'secure') }

  KINDS.each do |kind|
    define_method "#{kind}?" do
      self.kind == kind
    end
  end

  has_rich_text :body

  def published?
    is_published
  end

  def publish!
    update_attribute(:is_published, true)
  end

  def unpublish!
    update_attribute(:is_published, false)
  end
end
