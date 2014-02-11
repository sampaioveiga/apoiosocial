class HabitationsController < ApplicationController
	before_action :load_patient
	before_action :require_login

	def create
		@patient.create_habitation(habitation_params)
		flash[:success] = "Situação habitacional criada"
		redirect_to @patient
	end

	def edit
	end

	def update
		if @patient.habitation.update(habitation_params)
			flash[:success] = "Situação habitacional atualizada"
			redirect_to @patient
		else
			render 'edit'
		end
	end

	def destroy
		@patient.habitation.destroy
		flash[:success] = "Situação Habitacional eliminada"
		redirect_to @patient
	end

	private
		def load_patient
			@patient = Patient.find(params[:patient_id])
		end

		def habitation_params
			params.require(:habitation).permit(:habitationtype_id, :habitationoccupation_id, :morada, :cpostal, :cpostalext, :localidade, :meio_residencia, :numero_quartos, :sala, :casa_de_banho, :barreiras, :agua_canalizada, :electricidade, :esgotos, :estado_de_conservacao, :observacoes)
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
