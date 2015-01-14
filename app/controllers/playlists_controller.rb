class PlaylistsController < ApplicationController
<<<<<<< HEAD
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
=======

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
>>>>>>> cfd17aff85da5b0c1597209c52b76e031de2f039
	end

	private

<<<<<<< HEAD
	def authorize_if_admin
		redirect root_url unless admin?
	end
end
=======
end
>>>>>>> cfd17aff85da5b0c1597209c52b76e031de2f039
