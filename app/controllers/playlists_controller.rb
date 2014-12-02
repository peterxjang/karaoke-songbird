class PlaylistsController < ApplicationController
	def index
		@user_songs = current_playlist.user_songs
	end

end