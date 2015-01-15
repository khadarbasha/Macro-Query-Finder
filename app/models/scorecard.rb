class Scorecard < ActiveRecord::Base
  attr_accessible :best_score, :user_id
  validates_uniqueness_of :user_id
end
