class AddButtonClickToUsers < ActiveRecord::Migration
  def change
    add_column :users, :button_click, :boolean, :default=>false
  end
end
