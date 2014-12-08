class PlaylistsController < ApplicationController
	def index
		@user_songs = current_playlist.user_songs.limit(5)
		@now_playing = @user_songs[0]
		@user_songs = @user_songs[1..-1]
	end
end