class PatientsController < ApplicationController
	before_action :set_patient, except: [:index, :new, :create]
	before_action :require_login

	def index
		@patients = Patient.order('nome')
	end

	def show
	end

	def new
		@patient = Patient.new
	end

	def create
		@patient = Patient.new(patient_params)
		if @patient.save
			flash[:success] = "Utente criado"
			redirect_to @patient
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @patient.update(patient_params)
			flash[:success] = "Utente atualizado"
			redirect_to @patient
		else
			render 'edit'
		end
	end

	def destroy
		#if @patient.episodios is empty
		#then destroy
		#else inform cannot destroy
		redirect_to patients_path
	end

	private
		def patient_params
			params.require(:patient).permit(:nome, :data_de_nascimento, :estado_civil, :habilitacoes_literarias, :residencia, :telefone, :subsystem_id, :subsystem_number, :cartao_de_cidadao, :numero_identificacao_fiscal, :nome_contacto_preferencial, :telefone_contacto_preferencial, :morada_contacto_preferencial, :telemovel_contacto_preferencial)
		end

		def set_patient
			@patient = Patient.find(params[:id])
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
