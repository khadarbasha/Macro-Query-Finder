class AddHitsToTopScorer < ActiveRecord::Migration
  def change
    add_column :top_scorers, :hits, :integer, :default=>0
  end
end
