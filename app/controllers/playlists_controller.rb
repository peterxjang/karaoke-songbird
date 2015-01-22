class PlaylistsController < ApplicationController
	# before_action: :authorize_if_admin, except: :show

	def index
		@user_songs = current_playlist.user_songs.limit(5)
		@now_playing = @user_songs[0]
		@user_songs = @user_songs[1..-1]
	end

	def new
		@playlist = Playlist.new
	end

	def create
		@playlist = Playlist.new
		if @playlist.save
			respond_to do |format|
				format.html { redirect_to(playlist_url(@playlist))}
				# format.js { render {:"TODO" => :Implement }.to_json }
			end
		else
			render :new
		end
	end

	def edit
		@playlist = Playlist.find(params[:id])
	end

	def delete
		@playlist = Playlist.find(params[:id])
	end

	def destroy
	end

	def show
		perfs = current_playlist.performances
		@now_playing = perfs[0]
		@performances = perfs[1..-1]
	end

	def update 
		redirect_to current_playlist
	end

	def admin
		authorize_if_admin
		perfs = current_playlist.performances
		@now_playing = perfs[0]
		@performances = perfs[1..-1]
		@performance = Performance.new
	end

	private
	
	def authorize_if_admin
		redirect_to root_url unless admin?
	end
end

