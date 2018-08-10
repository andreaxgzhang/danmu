class AddSurveyToSlides < ActiveRecord::Migration[5.2]
  def change
    add_column :slides, :survery, :boolean
  end
end
