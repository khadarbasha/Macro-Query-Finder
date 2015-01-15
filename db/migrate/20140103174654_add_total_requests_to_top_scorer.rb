class AddTotalRequestsToTopScorer < ActiveRecord::Migration
  def change
    add_column :top_scorers, :total_requests, :integer, :default=>0
  end
end
