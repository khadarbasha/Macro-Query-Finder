class AddUserIdToUrlLists < ActiveRecord::Migration
   def self.up
    add_column :url_lists, :user_id, :integer
  end

  def self.down
    remove_column :user_lists, :user_id
  end
end
