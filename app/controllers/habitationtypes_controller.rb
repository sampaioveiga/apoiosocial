class HabitationtypesController < ApplicationController
	before_action :set_habitationtype, except: [ :index, :new, :create ]
	before_action :require_login

	def index
		@habitationtypes = Habitationtype.order('nome')
	end

	def new
		@habitationtype = Habitationtype.new
	end

	def create
		@habitationtype = Habitationtype.new(habitationtype_params)

		if @habitationtype.save
			flash[:success] = "Criado novo tipo de habitacao"
			redirect_to habitationtypes_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @habitationtype.update(habitationtype_params)
			flash[:success] = "Tipo de habitação alterado"
			redirect_to habitationtypes_path
		else
			render 'edit'
		end
	end

	def destroy
		@habitationtype.destroy
		redirect_to habitationtypes_path
	end

	private
		def habitationtype_params
			params.require(:habitationtype).permit(:nome)
		end

		def set_habitationtype
			@habitationtype = Habitationtype.find(params[:id])
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
