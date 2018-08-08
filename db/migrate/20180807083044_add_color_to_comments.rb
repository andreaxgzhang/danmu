class AddColorToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :color, :string
  end
end
