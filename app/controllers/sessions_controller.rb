class SessionsController < ApplicationController
	before_action :require_not_login, only: [ :new, :create ]

	def new
	end

	def create
		user = User.find_by_numero_mecanografico(params[:numero_mecanografico])
		if user && user.authenticate(params[:password]) && user.auth
			session[:user_id] = user.id
			flash[:success] = "Bem vindo #{user.nome}"
			redirect_to root_url
		else
			flash[:danger] = "Credenciais inválidas"
			render "new"
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:success] = "Sessão terminada"
		redirect_to login_path
	end

	private
		def require_not_login
			if logged_in?
				redirect_to root_url
			end
		end

		def logged_in?
			!!current_user
		end
end
