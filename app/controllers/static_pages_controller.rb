class StaticPagesController < ApplicationController
  
  def home
  end
  def global_leader_board
    @player_list = TopScorer.first(50)
    #@player_list = TopScorer.paginate(:page => params[:page])
    #myarray = TopScorer.all
    #@player_list = Kaminari.paginate_array(myarray).page(params[:page]).per(5)
  end
end

