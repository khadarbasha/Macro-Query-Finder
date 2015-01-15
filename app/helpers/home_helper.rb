module HomeHelper
  def get_current_position
    user_score = TopScorer.find_by_user_id(current_user.id)
    return "NA" if user_score == nil || user_score.hits == 0
    position = 0
    @users = TopScorer.all
    @users.each do |user|
      position = position +1
      if user.user_id == current_user.id
        return position
      end
    end
    return position
  end
  def check_message
    if current_user.button_click == true && current_user.time_out == true
      return true
    end
    return false
  end
  def create_time_stamp
    current_time = Time.now.to_i
    number_of_times_played = current_user.number_of_times_played
    current_user.game_starting_time = current_time
    current_user.game_ending_time = current_time + 240
    current_user.number_of_times_played = number_of_times_played + 1 
    current_user.save
  end
  def set_notice
    current_user.notice = current_user.notice + 1
    current_user.save
  end
  def get_notice
    current_user.notice
  end
  def clear_notice
    current_user.notice = 0
    current_user.save
  end
  def get_round_end_time
    current_user.game_ending_time
  end

  def create_list
    clear_notice

     #user = User.find(current_user.id)
    current_url_list = CurrentUrlList.all
    #puts current_url_list
    user_url_list = current_user.url_lists
    #puts user_url_list
    #common_url_list = current_url_list && user_url_list
    current_url_list.each do |url|
      if user_url_list.where(:name=>url.name).count == 0
        UrlList.new(:name=>url.name,:user_id=>current_user.id).save 
      end
    end
  end
  
  def challenge_succeded
      url_list = current_user.url_lists.where(:hit=>true)
      if url_list != nil
        if url_list.size == CurrentUrlList.all.count
          @user = User.find(current_user.id)
          @user.number_of_times_challenge_completed = @user.number_of_times_challenge_completed + 1
          @user.top_score = calculate_score
          @score_card = TopScorer.find_by_user_id(current_user.id)
          if @score_card!= nil
              @score_card.score = @user.top_score
              @score_card.save
          else
              TopScorer.new(:user_id=>current_user.id,:score=>@user.top_score, :name=>(@user.first_name+" "+@user.last_name)).save
              #@score_card.score = @user.top_score
              #@score_card.save
          end
          @user.save
          return true
        end
      end
    return false
  end
  
  def calculate_score
    user = User.find(current_user.id)
    return user.url_lists.where(:hit=>true).sum(:score)
  end
  
  def is_message_needed
    user = User.find(current_user.id)
    res = challenge_succeded 
    if user.number_of_times_challenge_completed == 0 && res
      return true
    end
    return false
  end
  
  def get_urls
    user = User.find(current_user.id)
    user.url_lists.order("score DESC")
  end
  
  def get_top_scorers_list
    #TopScorer.find(:first, :conditions => ['hits > ? ',0])
    #TopScorer.find(:first, :conditions => { :hits => 1})
    #TopScorer.find(:first, :conditions => ['hits > ?', 1]
    TopScorer.first(10)
  end

end