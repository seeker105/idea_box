class Idea < ApplicationRecord

  enum quality: %w(Swill Plausible Genius)

  def increment
    if quality == "Swill"
      update_attribute('quality', 'Plausible')
    elsif quality == "Plausible"
      update_attribute('quality', 'Genius')
    end
  end

  def decrement
    if quality == "Genius"
      update_attribute('quality', 'Plausible')
    elsif quality == "Plausible"
      update_attribute('quality', 'Swill')
    end
  end
end
