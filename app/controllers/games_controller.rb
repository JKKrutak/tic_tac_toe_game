class GamesController < ApplicationController
	def new
		@game = Game.new
	end
	
	def create

		state = game_state
		@game = Game.new(state: state)
		
		if @game.save
			redirect_to @game, notice: "Game added to database!"
		else 
			render :new
		end
	end
	
	
	private
		def game_state
			size = params[:game][:size].to_i
			state = "0" * (size * size)
		end
	
	
end
