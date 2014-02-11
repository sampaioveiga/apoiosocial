class InterventionsController < ApplicationController
before_action :set_intervention, except: [ :index, :new, :create]
	before_action :require_login

	def index
		@interventions = Intervention.order('nome')
	end

	def new
		@intervention = Intervention.new
	end

	def create
		@intervention = Intervention.new(intervention_params)
		if @intervention.save
			flash[:success] = "Intervenção criada"
			redirect_to interventions_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @intervention.update(intervention_params)
			flash[:success] = "Intervenção alterada"
			redirect_to interventions_path
		else
			render 'edit'
		end
	end

	def destroy
		@intervention.destroy
		flash[:success] = "Intervenção eliminado"
		redirect_to interventions_path
	end

	private
		def set_intervention
			@intervention = Intervention.find(params[:id])
		end

		def intervention_params
			params.require(:intervention).permit(:nome)
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
