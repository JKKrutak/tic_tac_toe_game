class PlayersController < ApplicationController
	def new
		@player = Player.new
	end
	def index
		@player = Player.all
	end
	def show
		@player = Player.find(params[:id])
	end
		
	def create
		@player = Player.new(player_params)
		@player.elo = 1200
		if @player.save
			redirect_to @player, notice: "Player added to database!"
		else 
			render :new
		end
	end
	
	
	private
		def player_params
			params.require(:player).permit(:name)
		end
	

end
