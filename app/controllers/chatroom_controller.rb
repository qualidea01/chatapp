class ChatroomController < ApplicationController
	def index
		@messages = Message.all
		@users = User.all
	end

	def show
	end
end
