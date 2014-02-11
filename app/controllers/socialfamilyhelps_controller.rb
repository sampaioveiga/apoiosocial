class SocialfamilyhelpsController < ApplicationController
	before_action :require_login
	before_action :set_socialfamilyhelp, except: [ :index, :new, :create ]

	def index
		@socialfamilyhelps = Socialfamilyhelp.order('nome')
	end

	def new
		@socialfamilyhelp = Socialfamilyhelp.new
	end

	def create
		@socialfamilyhelp = Socialfamilyhelp.new(socialfamilyhelp_params)
		if @socialfamilyhelp.save
			flash[:success] = "Tipo de ajuda guardada"
			redirect_to socialfamilyhelps_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @socialfamilyhelp.update(socialfamilyhelp_params)
			flash[:success] = "Tipo de ajuda atualizada"
			redirect_to socialfamilyhelps_path
		else
			render 'edit'
		end
	end

	def destroy
		@socialfamilyhelp.destroy
		flash[:success] = "Tipo de ajuda eliminada"
		redirect_to socialfamilyhelps_path
	end

	private
		def socialfamilyhelp_params
			params.require(:socialfamilyhelp).permit(:nome)
		end

		def set_socialfamilyhelp
			@socialfamilyhelp = Socialfamilyhelp.find(params[:id])
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
