class AddQueryToUrlList < ActiveRecord::Migration
  def change
    add_column :url_lists, :query, :string
  end
end
