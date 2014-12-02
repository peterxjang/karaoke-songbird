class Song < ActiveRecord::Base
	has_many :user_songs
	has_many :users, through: :user_songs

	def time
		minutes = self.duration / 60
		seconds = "#{self.duration % 60}".rjust(2, '0')
		"#{minutes}:#{seconds}"
	end
end
