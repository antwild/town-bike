class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :stars
      t.text :description
      t.references :bike, foreign_key: true
      t.references :rider, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
