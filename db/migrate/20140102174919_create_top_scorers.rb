class CreateTopScorers < ActiveRecord::Migration
  def change
    create_table :top_scorers do |t|
      t.string :name
      t.integer :score
      t.integer :user_id

      t.timestamps
    end
  end
end
