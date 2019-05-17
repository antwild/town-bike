class RemoveBikeIdFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :bike_id
  end
end
