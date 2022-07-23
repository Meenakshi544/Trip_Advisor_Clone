class ChangeApprovedByToBeIntegerInReviews < ActiveRecord::Migration[7.0]
  def change
    change_column :reviews, :approved_by, :integer
  end
end
