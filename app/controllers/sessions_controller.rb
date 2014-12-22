class SessionsController < ApplicationController
	def new
		if current_user
      redirect_to current_user
    end
	end

	def create
		if current_user
			@user = current_user
		else
			@user = User.find_by_email(params[:email])
			if @user && @user.authenticate(params[:password])
				session[:user_id] = @user.id
			end
		end
		if @user
			# redirect_to :categories
			render json: {valid: true}
		else
			# @message_signin = "Incorrect email or password!"
			# @user = User.new
			# render "new"
			render json: {valid: false}
		end
	end

	def destroy
		session[:user_id] = nil
		# redirect_to '/'
		render json: {valid: true}
	end
end