class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content
      t.boolean :is_sensored
      t.boolean :is_handled
      t.boolean :is_viewed
      t.references :user, foreign_key: true
      t.references :slide, foreign_key: true

      t.timestamps
    end
  end
end
