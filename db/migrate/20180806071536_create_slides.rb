class CreateSlides < ActiveRecord::Migration[5.2]
  def change
    create_table :slides do |t|
      t.string :iframe
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
