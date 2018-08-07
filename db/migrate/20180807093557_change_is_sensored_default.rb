class ChangeIsSensoredDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:comments, :is_sensored, false)
  end
end
