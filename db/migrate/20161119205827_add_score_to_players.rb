class AddScoreToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :score, :float
  end
end
