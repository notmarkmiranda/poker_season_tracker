class AddTotalExpenseToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :total_expense, :integer
  end
end
