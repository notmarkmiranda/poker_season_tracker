class CreateNemeses < ActiveRecord::Migration[5.0]
  def change
    create_table :nemeses do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
    add_index :nemeses, :follower_id
    add_index :nemeses, :followed_id
    add_index :nemeses, [:follower_id, :followed_id], unique: true
  end
end
