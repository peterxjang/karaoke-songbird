class PerformancesController < ApplicationController

	def index
	end

	def show
		
	end

	def new
		if params[:new_performance]  # user signs up for a song
			current_playlist.performances << Performance.new(new_performance_params)
		end

		if params[:performance_over]  # current performance finishes
			current_playlist.performances.shift
		end
	end

	def create
	end

	def edit
	end

	def update
	end

	private

	def new_performance_params
		params.require(:new_performance).permit(:song_id, :user_id)
	end

	def performance_over_params
		params.require(:performance_over).permit(:song_id, :user_id)
	end

end