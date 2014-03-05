class ContactsController < ApplicationController
	before_action :load_patient
	before_action :require_login

	def create
		@contact = @patient.contacts.create(contact_params)
		flash[:success] = "Contacto preferêncial #{@contact.nome} criado"
		redirect_to @patient
	end

	private
		def contact_params
			params.require(:contact).permit(:nome, :morada, :localidade, :telefone, :telemovel, :email)
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
