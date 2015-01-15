class AddNumberOfTimesChallengeCompletedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :number_of_times_challenge_completed, :integer, :default => 0
  end
end
