class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  BLACKLISTED_SUBDOMAINS = %w[
    user users blog blogs post posts comment comments mail email www application
    page pages profile profiles admin administrator root
  ].freeze

  devise :database_authenticatable, :rememberable, :validatable

  has_many :posts
  has_many :social_medias, dependent: :destroy
  accepts_nested_attributes_for :social_medias,
                                allow_destroy: true,
                                reject_if: lambda { |attr| blank_social_media_attributes?(attr) }

  validates :subdomain, uniqueness: true
  validates :subdomain, exclusion: { in: BLACKLISTED_SUBDOMAINS }
  validates :subdomain, length: { in: 3..20 }
  validates :subdomain, format: { with: /\A[a-z0-9]+\z/ }

  before_validation :set_random_username
  before_create :set_enc_key_and_iv

  has_rich_text :about

  def set_random_username
    return if subdomain.present?

    10.times do
      str = SecureRandom.urlsafe_base64(8).downcase
      yes = User.exists?(subdomain: str)

      if !yes
        self.subdomain = str
        break
      end
    end
  end

  def set_enc_key_and_iv
    self.enc_key ||= Util::Secure.generate_key
    self.enc_iv  ||= Util::Secure.generate_iv
  end

  private

  def self.blank_social_media_attributes?(attr)
    attr[:name].blank? || attr[:link].blank?
  end
end
