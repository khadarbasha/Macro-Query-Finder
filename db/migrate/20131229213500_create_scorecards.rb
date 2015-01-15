class CreateScorecards < ActiveRecord::Migration
  def change
    create_table :scorecards do |t|
      t.integer :user_id
      t.integer :best_score, :default=>0
      t.timestamps
    end
  end
end
