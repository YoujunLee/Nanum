class UsersController < ApplicationController
  def signup
  end

  def signup_complete
		user = User.new
		user.username = params[:username]
		user.code = params[:code]
		user.name = params[:name]
		user.number=params[:number]
		if params[:password] == params[:retype_password]
			user.password = params[:password]
			if user.save
				flash[:alert] = "성공적으로 가입되었습니다."
				redirect_to "/"
			else 
				flash[:alert] = user.errors.values.flatten.join(' ')
				redirect_to :back
			end
		else
			flash[:alert] = "비밀번호가 맞지 않습니다."
			redirect_to :back
		end
	end

  def login
  end

  def login_complete
		user=User.where(code: params[:code])[0]
		if user.nil?
			flash[:alert] = "학번을 잘못 입력하셨습니다."
			redirect_to :back
		elsif user.password != params[:password]
			flash[:alert] = "비밀번호를 잘봇 입력하셨습니다."
			redirect_to :back
		else 
			session[:user_id] = user.id
			flash[:alert] = "성공적으로 로그인하였습니다."
			redirect_to "/"
		end
  end

  def logout_complete
		reset_session
		flash[:alert] = "성공적으로 로그아웃하였습니다."
		redirect_to "/"
  end
end
