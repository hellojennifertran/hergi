class AddCategoryToGoals < ActiveRecord::Migration[6.0]
  def change
    add_column :goals, :category, :string
  end
end
