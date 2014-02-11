class ServicesController < ApplicationController
	before_action :set_service, except: [ :index, :new, :create]
	before_action :require_login

	def index
		@services = Service.order('nome')
	end

	def new
		@service = Service.new
	end

	def create
		@service = Service.new(service_params)
		if @service.save
			flash[:success] = "Serviço criado"
			redirect_to services_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @service.update(service_params)
			flash[:success] = "Serviço atualizado"
			redirect_to services_path
		else
			render 'edit'
		end
	end

	def destroy
		@service.destroy
		flash[:success] = "Serviço eliminado"
		redirect_to services_path
	end

	private
		def set_service
			@service = Service.find(params[:id])
		end

		def service_params
			params.require(:service).permit(:nome)
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