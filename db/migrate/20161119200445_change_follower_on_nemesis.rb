class ChangeFollowerOnNemesis < ActiveRecord::Migration[5.0]
  def change
    rename_column :nemeses, :follower_id, :nemesis_id
    rename_column :nemeses, :followed_id, :stalker_id
  end
end
