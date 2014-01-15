class SubsystemsController < ApplicationController
	before_action :set_subsystem, except: [:index, :new, :create]
	before_action :require_login

	def index
		@subsystems = Subsystem.order('nome')
	end

	def new
		@subsystem = Subsystem.new
	end

	def create
		@subsystem = Subsystem.new(subsystem_params)
		if @subsystem.save
			flash[:success] = "Subsistema criado"
			redirect_to subsystems_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @subsystem.update(subsystem_params)
			flash[:success] = "Subsistema atualizado"
			redirect_to subsystems_path
		else
			render 'edit'
		end
	end

	def destroy
		@subsystem.destroy
		redirect_to subsystems_path
	end

	private
		def subsystem_params
			params.require(:subsystem).permit(:nome)
		end

		def set_subsystem
			@subsystem = Subsystem.find(params[:id])
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
