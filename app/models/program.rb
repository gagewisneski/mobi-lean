class Program < ApplicationRecord
  has_many :users_programs
  has_many :users, through: :users_programs
  has_many :diets

  validates :start_date, :end_date, :password_digest, presence: true
end
