class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  #validates :phone_number, presence: true
  #validates :phone_number, length: { is: 10 }
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :phone_number, :number_of_times_challenge_completed, :top_score, :game_starting_time, :game_ending_time, :number_of_times_played,:total_requests,:hits,:message_needed
  # attr_accessible :title, :body
  has_many :url_lists
end
