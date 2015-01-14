class PlaylistsController < ApplicationController
	# before_action: :authorize_if_admin, except: :show

	def index
		@user_songs = current_playlist.user_songs.limit(5)
		@now_playing = @user_songs[0]
		@user_songs = @user_songs[1..-1]
	end

	def show
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

	def update
	end

	private

	def authorize_if_admin
		redirect root_url unless admin?
	end
end