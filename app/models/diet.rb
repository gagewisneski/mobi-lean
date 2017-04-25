class Diet < ApplicationRecord
  belongs_to :user
  belongs_to :program

  def anything?
    if ((nuts_and_seeds + greek_yogurt + cheese + almond_butter + zoodles + spaghetti_squash + hummus_and_guac + cottage_cheese + fruit + happy + bean + chocolate_bar) > 0)
      return true
    elsif hawaiian_nut_fast
      return true
    elsif hour_fast_18
      return true
    elsif cheat_meal
      return true
    else
      return false
    end
  end
end
