class AddMesssageNeededToUsers < ActiveRecord::Migration
  def change
    add_column :users, :message_needed, :boolean, :default=>true
  end
end
