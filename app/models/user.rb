class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable

  has_many :posts
  validates :subdomain, uniqueness: true
  before_validation :set_random_username

  def set_random_username
    return if self.subdomain.present?

    10.times do
      str = SecureRandom.urlsafe_base64(8).downcase
      yes = User.exists?(subdomain: str)

      if !yes
        self.subdomain = str
        break
      end
    end
  end
end
