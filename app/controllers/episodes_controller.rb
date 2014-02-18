class EpisodesController < ApplicationController
	before_action :load_patient
	before_action :set_episode, except: [ :new, :create, :archive ]
	before_action :check_status, only: [ :edit, :update, :destroy]
	before_action :require_login

	def show
	end

	def create
		@patient.episodes.create(episode_params)
		redirect_to @patient
	end

	def edit
	end

	def update
		if @episode.update(episode_params)
			flash[:success] = "Episódio atualizado"
			redirect_to [@patient, @episode]
		else
			render 'edit'
		end
	end

	def archive
		episode = Episode.find(params[:episode_id])
		unless episode.estado
			Episode.update(episode.id, estado: true)
			flash[:success] = "Episódio #{episode.data} arquivado"
			redirect_to @patient
		else
			flash[:danger] = "Episódio arquivado. Não é possível alterar o registo"
			redirect_to [@patient, episode]
		end
	end

	def destroy
		flash[:success] = "Episódio eliminado"
		@episode.destroy
		redirect_to @patient
	end

	private
		def episode_params
			params.require(:episode).permit(:data, :data_pedido_colaboracao, :user_id, :unit_id, :service_id, :intervention_id, :program_id, :diagnostico, :encaminhamento)
		end

		def load_patient
			@patient = Patient.find(params[:patient_id])
		end

		def set_episode
			@episode = @patient.episodes.find(params[:id])
		end

		def check_status
			if @episode.estado
				flash[:danger] = "Episódio arquivado. Não é possível alterar o registo"
				redirect_to [@patient, @episode]
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
