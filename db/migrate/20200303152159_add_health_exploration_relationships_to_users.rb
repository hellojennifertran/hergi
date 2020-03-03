class AddHealthExplorationRelationshipsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :health_goal, :integer
    add_column :users, :exploration_goal, :integer
    add_column :users, :relationships_goal, :integer
  end
end
