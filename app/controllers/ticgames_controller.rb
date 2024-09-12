class TicgamesController < ApplicationController
include Math
@@player_char = '@'
	def index
		@game = Ticgame.all
	end
	def new
		
	end
	def create
		@game = Ticgame.new
		size = params[:size].to_i
		state = '0' * size * size
		@game.state = state
		if @game.save
			redirect_to action: "show", id: @game.id  
		else
			render :new
		end
	end
	def show
		@id = params[:id]
		@game = Ticgame.find(@id)
		@row_length = sqrt(@game.state.length())
	end
	def make_move
		if @@player_char == 'X'
			@@player_char = '@'
		else
			@@player_char = 'X'
		end
		@id = params[:id]
		index = params[:index].to_i
		@game = Ticgame.find(@id)
		if @game.state[index] == '0'
			@game.state[index] = @@player_char
		end
		
		 
		state_array = string_to_array(sqrt(@game.state.length()),@game.state)
		coordinates = find_coordinates(state_array, sqrt(@game.state.length()), index)
		game_end = check_win_condition(state_array, sqrt(@game.state.length()), coordinates)
		#binding.pry
		@game.save
		redirect_to action: "show", id: @game.id
	end
	def string_to_array(size, state)
		game_array = Array.new(size) {Array.new(size)}
		
		for first_index in 0..size-1
			for second_index in 0..size-1
				game_array[first_index][second_index] = state[(first_index*size)+second_index]
			end
		end
		game_array
	end
	def find_coordinates(state_array, size, index)
		move_coordinate_x = 0
		move_coordinate_y = 0
		for first_index in 0..size-1
			for second_index in 0..size-1
				if (first_index*size) + second_index == index
					move_coordinate_x = first_index
					move_coordinate_y = second_index
				end
			end
		end
		return [move_coordinate_x, move_coordinate_y]
	end
	
	def check_win_condition(state_array, size, coordinates)
		return false
	end
end