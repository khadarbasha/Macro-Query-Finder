class TopScorer < ActiveRecord::Base
  attr_accessible :name, :score, :user_id, :total_requests, :hits
  validates :name, uniqueness: true
  default_scope :order => 'hits DESC, score ASC, total_requests ASC'
end
