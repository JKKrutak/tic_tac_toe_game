class PlayerController < ApplicationController
	def new
		@player = Player.new
	end
	def index
		@player = Player.all
	end
	def show

	end
		
	def create
	
		@player = Player.new(player_params)
		binding.pry
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
