class PlaylistsController < ApplicationController

	def show
		perfs = current_playlist.performances
		@now_playing = perfs[0]
		@performances = perfs[1..-1]
	end

	def update
		if params[:new_performance]  # user signs up for a song
			song_id = params[:new_performance][:song_id]
			performance = Performance.create(user: current_user, 
																			 song: Song.find(song_id), 
																			 playlist: current_playlist)
			# websockets - send message to all clients to refresh their playlist
			# 
			# 
			render json: {valid: performance.valid?}
		elsif params[:performance_over]  # current performance finishes
			current_playlist.performances.shift
			render json: {valid: true}
		else
			render json: {valid: false}
		end
	end

	def admin
		perfs = current_playlist.performances
		@now_playing = perfs[0]
		@performances = perfs[1..-1]
		@performance = Performance.new
	end

	def search
		query = params[:query]
		@results = Song.where("lower(title) LIKE :query OR lower(artist) LIKE :query", query: "%#{query.downcase}%").limit(10) #current_playlist.performances
		render json: {html: render_to_string(partial: 'search_results'), valid: true}
	end

	def song_signup
		if current_user
			@song = Song.find_by_id(params[:id])
			if @song
				render json: {html: render_to_string(partial: 'song_signup'), valid: true}
			else
				render json: {valid: false}
			end
		else
			render json: {valid: false}
		end
	end

	private

	def new_performance_params
		params.require(:new_performance).permit(:song_id, :user_id)
	end

	def performance_over_params
		params.require(:performance_over).permit(:song_id, :user_id)
	end

end
