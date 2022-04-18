class HomeController < ApplicationController
  def index
    @users = User.all
  end

  def new_game
    player_id = params[:user_id]
    if player_id.empty?
      flash[:notice] = "something"
      flash[:mishmish] = "something else"
      redirect_to '/?warning=Please choose a player to start a new game'
    else
      redirect_to new_game_session_path({user_id:params[:user_id]})
    end
  end
end

