class Program < ApplicationRecord
  has_many :users_programs
  has_many :users, through: :users_programs
end
