class User < ApplicationRecord
  attr_accessor :activation_token

  has_secure_password

  has_many :diets
  has_many :users_programs
  has_many :programs, through: :users_programs

  validates :first_name, :last_name, :email, :password_digest, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  before_save   :downcase_email
  before_create :create_activation_digest


  def admin
    if id == 1 || id == 2
      return true
    end
  end

  def active_diet
    if programs.where(active: true).first
      programs.where(active: true).order(:id).first.id
    end
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def authenticated?(attribute, token)
    digest = self.send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  private

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def downcase_email
    self.email = email.downcase
  end

  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end
end
