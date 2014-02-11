class EpisodesController < ApplicationController
	before_action :load_patient
	before_action :require_login

	def create
		@patient.episodes.create(episode_params)
		redirect_to @patient
	end

	def edit
		@episode = @patient.episodes.find(params[:id])
	end

	private
		def episode_params
			params.require(:episode).permit(:data, :data_pedido_colaboracao, :user_id, :unit_id, :service_id, :intervention_id, :program_id, :diagnostico, :encaminhamento)
		end

		def load_patient
			@patient = Patient.find(params[:patient_id])
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
