class SocialfamiliesController < ApplicationController
	before_action :load_patient
	before_action :require_login

	def create
		@patient.create_socialfamily(socialfamily_params)
		flash[:success] = "Situação socio familiar criada"
		redirect_to @patient
	end

	def edit
	end

	def update
		if @patient.socialfamily.update(socialfamily_params)
			flash[:success] = "Situação socio familiar atualizada"
			redirect_to @patient
		else
			render 'edit'
		end
	end

	def destroy
		@patient.socialfamily.destroy
		flash[:success] = "Situação socio familiar eliminada"
		redirect_to @patient
	end

	private
		def socialfamily_params
			params.require(:socialfamily).permit(:companhia, :apoio, :socialfamilyhelp_id, :observacoes)
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
