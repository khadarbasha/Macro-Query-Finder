class CreateCurrentUrlLists < ActiveRecord::Migration
  def change
    create_table :current_url_lists do |t|
      t.string :name

      t.timestamps
    end
  end
end
