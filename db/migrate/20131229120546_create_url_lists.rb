class CreateUrlLists < ActiveRecord::Migration
  def change
    create_table :url_lists do |t|
      t.string :name
      t.boolean :hit, :default=>false
      t.integer :score, :default=>0

      t.timestamps
    end
  end
end
