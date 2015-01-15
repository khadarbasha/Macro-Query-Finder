class AddGameEndignTimeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :game_ending_time, :integer
  end
end
