class SessionsController < ApplicationController
	before_action :logged_in_redirect, only: [:new, :create]
	def new 
	end

	def create
		user = User.find_by(username: params[:session] [:username])
		#もし認証に
		if user && user.authenticate(params[:session] [:password])
			#成功したら
			session[:user_id] = user.id
			flash[:notice] = "ログインに成功しました"
			redirect_to root_path
		else
			#失敗したら
			flash.now[:danger] = "ログインに失敗しました。再度ログインしてください"
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "ログアウトしました"
		redirect_to login_path
	end

	private

	def logged_in_redirect
		if logged_in?
			flash[:danger] = "既にログインしています"
			redirect_to root_path
		end
	end
end
