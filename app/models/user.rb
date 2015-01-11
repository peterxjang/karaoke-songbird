class User < ActiveRecord::Base
	has_secure_password

	has_many :performances
	has_many :songs, through: :performances

	def name
		"#{self.first_name} #{self.last_name}"
	end
end
