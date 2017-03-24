class User < ApplicationRecord
  has_secure_password

  has_many :diets
  belongs_to :program
end
