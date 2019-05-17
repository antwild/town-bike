class RemoveRiderIdFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :rider_id
  end
end
