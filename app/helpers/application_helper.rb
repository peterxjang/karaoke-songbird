module ApplicationHelper
	def current_user
		User.find_by_id(session[:user_id])
	end

	def current_playlist
		Playlist.last
	end

	def admin?
		if current_user
			current_user.admin
		end
	end
end
