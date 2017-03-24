class Program < ApplicationRecord
  has_many :users

  def strf_dates
    "#{start_date.strftime('%b %d, %Y')} - #{end_date.strftime('%b %d, %Y')}"
  end
end
