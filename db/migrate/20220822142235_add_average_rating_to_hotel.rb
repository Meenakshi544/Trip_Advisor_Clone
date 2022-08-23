class AddAverageRatingToHotel < ActiveRecord::Migration[7.0]
  def change
    add_column :hotels, :average_rating, :float, default: 0
  end
end
