class UrlList < ActiveRecord::Base
  attr_accessible :hit, :name, :score, :user_id
  belongs_to :user
end
