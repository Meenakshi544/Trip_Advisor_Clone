class AddApprovedbyToReview < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :approved_by, :string, default: nil
  end
end
