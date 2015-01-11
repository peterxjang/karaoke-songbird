class Song < ActiveRecord::Base
	has_many :performances
	has_many :users, through: :performances

	def time
		minutes = self.duration / 60
		seconds = "#{self.duration % 60}".rjust(2, '0')
		"#{minutes}:#{seconds}"
	end
end
