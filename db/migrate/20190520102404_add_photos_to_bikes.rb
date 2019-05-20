class AddPhotosToBikes < ActiveRecord::Migration[5.2]
  def change
    add_column :bikes, :photo, :string
  end
end
