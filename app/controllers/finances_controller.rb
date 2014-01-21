class FinancesController < ApplicationController
	before_action :load_patient
	before_action :require_login

	def create
		@patient.create_finance(finance_params)
		flash[:sucess] = "Situação financeira criada"
		redirect_to @patient
	end

	def edit
	end

	def update
		if @patient.finance.update(finance_params)
			flash[:success] = "Situação financeira atualizada"
			redirect_to @patient
		else
			render 'edit'
		end
	end

	def destroy
		@patient.finance.destroy
		flash[:success] = "Situação financeira eliminada"
		redirect_to @patient
	end

	private
		def finance_params
			params.require(:finance).permit(:pension_id, :montante, :observacoes)
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
