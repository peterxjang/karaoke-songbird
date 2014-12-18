module ApplicationHelper
	def current_user
		User.find_by_id(session[:user_id])
	end

	def current_playlist
		Playlist.last
	end

	def spotify_search_url(track, artist)
		"https://api.spotify.com/v1/search?" + 
		"query=artist:#{artist.gsub(' ', '%20')}+track:#{track.gsub(' ', '%20')}&" +
		"limit=1&" +
		"type=track"
	end
end
