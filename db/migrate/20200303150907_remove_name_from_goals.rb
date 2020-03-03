class RemoveNameFromGoals < ActiveRecord::Migration[6.0]
  def change

    remove_column :goals, :name, :string
  end
end
