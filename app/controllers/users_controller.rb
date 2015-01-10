class UsersController < ApplicationController
	def index
	end

	def show
		@user = current_user
	end

	def new
	end

	def create
		@user = User.new(first_name: params[:first_name],
										 last_name: params[:last_name],
										 email: params[:email],
										 password: params[:password],
										 admin: false)
		if @user.save
			session[:user_id] = @user.id
			# redirect_to @user
			render json: {valid: true}
		else
			# render "new"
			render json: {valid: false}
		end
	end

	def edit
	end

	def update
	end

	private

	# def user_creation_params
	# 	params.require(:user).permit(:first_name, :last_name, :email, :password)
	# end
end