class RemoveTypeFromGoals < ActiveRecord::Migration[6.0]
  def change

    remove_column :goals, :type, :string
  end
end
