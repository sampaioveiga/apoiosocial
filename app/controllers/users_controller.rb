class UsersController < ApplicationController
	before_action :require_login, except: [ :new, :create ]
	before_action :is_admin, only: [ :index, :destroy ]
	before_action :set_user, only: [ :show, :edit, :update, :destroy ]

	def index
		@users = User.order('nome')
	end

	def show
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

	def edit
	end

	def update
		if @user.update(user_params)
			flash[:success] = "Utilizador atualizado"
			redirect_to users_path
		else
			render 'edit'
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

		def is_admin
			unless current_user.admin
				redirect_to root_url
			end
		end

		def set_user
			unless current_user.admin
				@user = User.find(current_user.id)
			else
				@user = User.find(params[:id])
			end
		end
end