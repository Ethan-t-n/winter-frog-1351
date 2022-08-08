class Garden < ApplicationRecord
  has_many :plots
  has_many :plot_plants, through: :plots
  has_many  :plants, through: :plot_plants

  def distinct_plants
    plants.select('plants.*')
    .where('plants.days_to_harvest > ?', '99')
    .distinct
  end
end
