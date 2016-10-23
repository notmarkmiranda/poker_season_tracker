class AddTotalExpenseToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :additional_expense, :integer, default: 0
  end
end
