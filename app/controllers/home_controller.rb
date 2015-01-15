class HomeController < ApplicationController
  include HomeHelper
  before_filter :authenticate_user!
  def user_submissions
  end
  def score_board
    current_user.time_out = true
    current_user.save
  end
  def index
   #create_list
   #current_user.url_lists
   if current_user.button_click == false
     redirect_to user_root_path, :flash => { :info => "Please click on start game to proceed." }
    elsif current_user.button_click == true && current_user.time_out == false
      create_list
      return current_user.url_lists
    elsif current_user.button_click == true && current_user.time_out == true
         current_user.message_needed = false
         redirect_to user_score_board_path
    end
    #if current_user.number_of_times_played != 0
     # create_list
     # current_user.url_lists
   #else
    # redirect_to user_root_path, :flash => { :info => "Please click on start game to proceed." }
    #end
  end
  def time_stamp_create
    if current_user.button_click == false
      current_user.button_click = true
      current_user.save
      create_time_stamp
      redirect_to game_root_path
    elsif current_user.button_click == true && current_user.time_out == false
      redirect_to game_root_path
    elsif current_user.button_click == true && current_user.time_out == true
      redirect_to user_score_board_path
    end
    #elsif
    #if current_user.number_of_times_played ==0
    #  create_time_stamp
    #  redirect_to game_root_path
    #elsif current_user.time_out == false
    #  redirect_to game_root_path
    #else
     # redirect_to user_score_board_path, :flash => { :info => "You have already played the game." }
    #end
  end
  def search_results
    if TopScorer.find_by_user_id(current_user.id)==nil
      #new_user = TopScorer.new(:user_id=>current_user.id,:score=>0,:name=>current_user.first_name+" "+current_user.last_name)
      #new_user.save
      TopScorer.create(:user_id=>current_user.id,:score=>0,:name=>current_user.first_name+" "+current_user.last_name)
    end
    user_score_board = TopScorer.find_by_user_id(current_user.id)
    if user_score_board==nil
      TopScorer.create(:user_id=>current_user.id,:score=>0,:name=>current_user.first_name+" "+current_user.last_name)
    end
    user = User.find(current_user.id)
    ##########update total requests##########
    user.total_requests = user.total_requests+1
    user_score_board.total_requests = user_score_board.total_requests+1
    #########################################
    if params[:search].length != 0
      key="Z7sRy/lYKEUbgTobF6xkI8ThHOKSacJX974KU1yxjt4"
      #key = "Iu+Qe7GFbQS32r+id7sxRp8pWyGUAwfKuQtIQhr3w0w"
      search_engine = Bing.new(key,10,"Web")
      search_results = search_engine.search(params[:search])
        #puts search_results[0][:Web].length
      web_results = search_results[0][:Web]
      if web_results.length > 0
        top_url = web_results[0][:DisplayUrl]
        url = user.url_lists.find_by_name(top_url)
        if url != nil
          if url.score == 0
            url.score = params[:search].length
            url.query = params[:search]
          elsif url.score > 0
            if url.score > params[:search].length
              url.query = params[:search]
              url.score = params[:search].length
            end
          end
            url.hit = true
            url.save
            hit_list = current_user.url_lists.where(:hit=>true)
            user_score_board.hits = hit_list.count
            user_score_board.score = calculate_score
          end
          user_score_board.save
          user.top_score = calculate_score
          user.save
          @search_results = Array.new
          web_results.each do |result|
            hit_result = true if url!=nil && result[:DisplayUrl] == url.name
            @search_results.push({
              :Title=>result[:Title],
              :DisplayUrl=>result[:DisplayUrl],
              :Description=>result[:Description],
              :Url=>result[:Url],
              :Hit=> hit_result
              })
            hit_result = false
          end
          @search_results
        end
      end
  end

  def score_card
    @players_list = TopScorer.all
    respond_to do |format|
      format.html
      format.js
    end
  end
end