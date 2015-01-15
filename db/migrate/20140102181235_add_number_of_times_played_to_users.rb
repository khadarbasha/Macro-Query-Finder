class AddNumberOfTimesPlayedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :number_of_times_played, :integer, :default=>0
  end
end
