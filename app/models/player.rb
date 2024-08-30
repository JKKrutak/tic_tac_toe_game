class Player < ApplicationRecord
	validates :name, presence: true
	has_many :gamesplayer
	has_many :games, through: :gamesplayer
end
