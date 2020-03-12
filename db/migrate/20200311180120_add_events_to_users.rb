class AddEventsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :events, :jsonb, default: []
  end
end
