class NotesController < ApplicationController
	before_action :load_episode
	before_action :set_note, except: [ :new, :create, :index ]
	before_action :check_episode_status
	#rescue_from ActiveRecord::RecordInvalid, with: :show_errors
	before_action :require_login

	def new
	end

	def create
		@note = @episode.notes.create!(note_params)
		flash[:success] = "Nota no episódio #{@episode.data} criada"
		redirect_to @episode.patient
	end

	def edit
	end

	def update
		if @note.update(note_params)
			flash[:success] = "Nota no episódio #{@episode.data} atualizada"
			redirect_to @episode.patient
		else
			render 'edit'
		end
	end

	def destroy
		if @episode.estado
			flash[:danger] = "Episódio #{@episode.data} arquivado. Não é possível alterar o registo"
			redirect_to @episode.patient
		else
			@note.destroy
			flash[:success] = "Nota do episódio #{@episode.data} eliminada"
			redirect_to @episode.patient
		end
	end

	private
		def note_params
			params.require(:note).permit(:data, :nota, :user_id)
		end

		def check_episode_status
			if @episode.estado
				flash[:danger] = "Episódio arquivado. Não é possível alterar o registo"
				redirect_to [@episode.patient, @episode]
			end
		end

#		def show_errors(exception)
#			flash[:danger] = exception.message
#			redirect_to [@episode.patient, @episode]
#		end

		def load_episode
			@episode = Episode.find(params[:episode_id])
		end

		def set_note
			@note = @episode.notes.find(params[:id])
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
