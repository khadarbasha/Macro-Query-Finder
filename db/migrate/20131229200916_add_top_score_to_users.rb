class AddTopScoreToUsers < ActiveRecord::Migration
  def change
    add_column :users, :top_score, :integer, :default => 0
  end
end
