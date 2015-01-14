class Playlist < ActiveRecord::Base
	has_many :performances
	has_many :users, through: :performances
	has_many :songs, through: :performances
end
