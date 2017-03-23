class User < ApplicationRecord
  has_many :diets
  belongs_to :program
end
