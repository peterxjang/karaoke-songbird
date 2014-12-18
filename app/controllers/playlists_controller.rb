class PlaylistsController < ApplicationController

	def show
		@user_songs = current_playlist.user_songs
		@now_playing = @user_songs[0]
		@user_songs = @user_songs[1..-1]
	end

	def update  # maybe change user_songs to performances?
		if params[:new_performance]  # user signs up for a song
		current_playlist.user_songs << UserSong.new(new_performance_params)
		end

		if params[:performance_over]  # current performance finishes
			current_playlist.user_songs.shift
		end

		redirect_to current_playlist
	end

	private

	def new_performance_params
		params.require(:new_performance).permit(:song_id, :user_id)
	end

	def performance_over_params
		params.require(:performance_over).permit(:song_id, :user_id)
	end
end
