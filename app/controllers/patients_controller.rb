class PatientsController < ApplicationController
	before_action :set_patient, except: [:index, :new, :create, :search]
	before_action :require_login

	def index
		#@patients = Patient.order('nome')
		@patients = Patient.order('nome').paginate(page: params[:page], :per_page => 30)
	end

	def show
		@episodes = @patient.episodes.order('data DESC')
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
			flash[:success] = "Utente #{@patient.nome} atualizado"
			redirect_to @patient
		else
			render 'edit'
		end
	end

	def destroy
		if @patient.episodes.count == 0
			flash[:success] = "#{@patient.nome} eliminado."
			@patient.destroy
			redirect_to patients_path
		else 
			flash[:danger] = "Não é possível eliminar #{@patient.nome}. Já tem episódios criados."
			redirect_to @patient
		end
	end

	def search
		@patients = Patient.where("nome LIKE :prefix", prefix: "%#{params[:search_string]}%").paginate(page: params[:page], :per_page => 30)
		if @patients.empty?
			@patients = Patient.where("cartao_de_cidadao = :prefix OR numero_identificacao_fiscal = :prefix OR rnu = :prefix OR niss = :prefix", prefix: "#{params[:search_string]}").paginate(page: params[:page], :per_page => 30)
		end
		if @patients.empty?
			flash[:info] = "A pesquisa não devolveu resultados"
			redirect_to new_patient_path
		else
			render 'index'
		end
	end

	private
		def patient_params
			params.require(:patient).permit(:nome, :data_de_nascimento, :genero, :estado_civil, :habilitacoes_literarias, :residencia, :ocupacao, :telefone, :telemovel, :rnu, :subsystem_id, :subsystem_number, :cartao_de_cidadao, :numero_identificacao_fiscal, :email, :niss)
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
