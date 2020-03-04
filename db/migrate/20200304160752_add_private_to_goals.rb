class AddPrivateToGoals < ActiveRecord::Migration[6.0]
  def change
    add_column :goals, :private, :boolean, default: false
  end
end
