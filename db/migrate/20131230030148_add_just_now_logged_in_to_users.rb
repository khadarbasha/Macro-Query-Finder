class AddJustNowLoggedInToUsers < ActiveRecord::Migration
  def change
    add_column :users, :just_now_logged_in, :boolean, :default => false
  end
end
