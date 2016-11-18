class AddCompletedToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :completed, :boolean, default: false
  end
end
