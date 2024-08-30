class Game < ApplicationRecord
	has_many :gamesplayer
	has_many :players, through: :gamesplayer
end
