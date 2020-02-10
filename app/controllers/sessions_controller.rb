class SessionsController < ApplicationController
	def new 
	end

	def create
		user = User.find_by(username: params[:session] [:username])
		#もし認証に
		if user && user.authenticate(params[:session] [:password])
			#成功したら
			session[:user_id] = user.id
			flash[:success] = "ログインに成功しました"
			redirect_to root_path
		else
			#失敗したら
			flash.now[:error] = "ログインに失敗しました。再度ログインしてください"
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:success] = "ログアウトしました"
		redirect_to login_path
	end
end
