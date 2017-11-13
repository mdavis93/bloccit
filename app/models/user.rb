class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  before_save { self.email = email.downcase if email.present? }
  before_save { self.name = name.split.map!{|name| name.capitalize}.join(" ") if name.present? }
  before_save { self.role ||= :member }

  EMAIL_REGEX = /\A[\w\-.]+@[a-z\d\-.]+\.[a-z]{2,}\z/i

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 254 },
            format: { with: EMAIL_REGEX }

  has_secure_password

  enum role: [:member, :admin]
end
