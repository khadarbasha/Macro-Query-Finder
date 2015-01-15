class AddGameStartingTimeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :game_starting_time, :integer
  end
end
