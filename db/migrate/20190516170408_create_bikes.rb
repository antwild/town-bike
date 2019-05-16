class CreateBikes < ActiveRecord::Migration[5.2]
  def change
    create_table :bikes do |t|
      t.text :description
      t.string :make
      t.string :model
      t.string :color
      t.string :type
      t.string :frame_size
      t.boolean :foldable
      t.string :location
      t.references :owner, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
