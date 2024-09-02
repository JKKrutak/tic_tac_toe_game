class SessionsController < ApplicationController
  def new
  end

  def create
	player = Player.find_by(name: params[:player_name])
	if player
		session[:player_id] = player.id
		redirect_to root_path, notice: "logged in"
	else
		flash.now[:alert] = "Something went wrong :("
		redirect_to login_failure_path 
	end
  end

  def destroy
		session[:player_id] = nil
		redirect_to root_url, notice: "looged out"
  end
  


end
