class SessionController < ApplicationController
  def new
  end

  def create
	player = Player.find_by(name: params[:session][:name])
	if player
		log_in player
		redirect_to player_path(player), notice: "logged in"
	else
		flash.alert = "Something went wrong :("
		render 'new'
	end
  end

  def destroy
		log_out
		redirect_to root_url, notice: "looged out"
  end
  
  private
  
	def log_in(player)
		session[:player_id] = player.id
	end
	
	def log_out
		session.delete(:player_id)
		@current_player = nil
	end

end
