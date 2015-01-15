class AddTimeOutToUsers < ActiveRecord::Migration
  def change
    add_column :users, :time_out, :boolean, :default=>false
  end
end
