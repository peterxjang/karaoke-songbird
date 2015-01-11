class PlaylistsController < ApplicationController

	def show
		perfs = current_playlist.performances
		@now_playing = perfs[0]
		@performances = perfs[1..-1]
	end

	def update 
		redirect_to current_playlist
	end

	def admin
		perfs = current_playlist.performances
		@now_playing = perfs[0]
		@performances = perfs[1..-1]
		@performance = Performance.new
	end

	private

end
