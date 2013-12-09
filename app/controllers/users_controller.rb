class UsersController < ApplicationController
	before_action :require_login, except: [ :new, :create ]

	def index
		@users = User.order('nome')
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		set_user_authorisation
		if @user.save
			flash[:success] = "Utilizador criado. A aguardar autorização"
			redirect_to root_url
		else
			render 'new'
		end
	end

	private
		def user_params
			params.require(:user).permit(:nome, :numero_mecanografico, :email, :password, :password_confirmation, :auth, :admin)
		end

		def set_user_authorisation
			if User.first.nil?
				@user.auth = true
				@user.admin = true
			else
				@user.auth = false
				@user.admin = false
			end
		end

		def require_login
			unless logged_in?
				redirect_to login_path
			end
		end

		def logged_in?
			!!current_user
		end
end