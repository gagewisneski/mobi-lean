class Blog < ApplicationRecord
  validates :title, :text, presence: true
end
