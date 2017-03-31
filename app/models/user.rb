class User < ApplicationRecord
  has_secure_password

  has_many :diets
  belongs_to :program

  validates :first_name, :last_name, :email, :password_digest, :program_id, presence: true
  validates :email, uniqueness: true
end
