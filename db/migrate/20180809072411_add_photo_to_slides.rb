class AddPhotoToSlides < ActiveRecord::Migration[5.2]
  def change
    add_column :slides, :photo, :string
  end
end
