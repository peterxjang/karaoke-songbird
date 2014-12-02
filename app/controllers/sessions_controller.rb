class SessionsController < ApplicationController
	def new
		if current_user
      redirect_to current_user
    end
	end

	def create

	end

	def destroy

	end
end