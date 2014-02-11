class ProgramsController < ApplicationController
	before_action :set_program, except: [ :index, :new, :create]
	before_action :require_login

	def index
		@programs = Program.order('nome')
	end

	def new
		@program = Program.new
	end

	def create
		@program = Program.new(program_params)
		if @program.save
			flash[:success] = "Programa criado"
			redirect_to programs_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @program.update(program_params)
			flash[:success] = "Programa alterado"
			redirect_to programs_path
		else
			render 'edit'
		end
	end

	def destroy
		@program.destroy
		flash[:success] = "Programa eliminado"
		redirect_to programs_path
	end

	private
		def set_program
			@program = Program.find(params[:id])
		end

		def program_params
			params.require(:program).permit(:nome)
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
