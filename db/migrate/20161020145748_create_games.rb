class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.date :date
      t.integer :buy_in
      t.time :time_played
      t.references :season, foreign_key: true

      t.timestamps
    end
  end
end
