class AddCategoryTypeToGoals < ActiveRecord::Migration[6.0]
  def change
    add_column :goals, :category_type, :string
  end
end
