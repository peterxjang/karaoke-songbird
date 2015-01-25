class PlaylistsController < ApplicationController

	def show
		perfs = current_playlist.performances
		@now_playing = perfs[0]
		@performances = perfs[1..-1]
	end

	def update
		if params[:new_performance]  # user signs up for a song
			puts params[:new_performance][:song_id]
			# current_playlist.performances << Performance.new(new_performance_params)

	

			redirect_to current_playlist
		end

		if params[:performance_over]  # current performance finishes
			current_playlist.performances.shift
		end
	end

	def admin
		perfs = current_playlist.performances
		@now_playing = perfs[0]
		@performances = perfs[1..-1]
		@performance = Performance.new
	end

	private

	def new_performance_params
		params.require(:new_performance).permit(:song_id, :user_id)
	end

	def performance_over_params
		params.require(:performance_over).permit(:song_id, :user_id)
	end

end
