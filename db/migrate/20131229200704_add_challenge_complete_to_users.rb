class AddChallengeCompleteToUsers < ActiveRecord::Migration
  def change
    add_column :users, :challenge_complete, :boolean, :default => false 
  end
end
