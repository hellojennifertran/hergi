class DropCategoriesTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :categories
  end
end
