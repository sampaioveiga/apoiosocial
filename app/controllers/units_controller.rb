class UnitsController < ApplicationController
	before_action :set_unit, except: [ :index, :new, :create]
	before_action :require_login

	def index
		@units = Unit.order('nome')
	end

	def new
		@unit = Unit.new
	end

	def create
		@unit = Unit.new(unit_params)
		if @unit.save
			flash[:success] = "Unidade criada"
			redirect_to units_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @unit.update(unit_params)
			flash[:success] = "Unidade alterada"
			redirect_to units_path
		else
			render 'edit'
		end
	end

	def destroy
		@unit.destroy
		flash[:success] = "Unidade eliminado"
		redirect_to units_path
	end

	private
		def set_unit
			@unit = Unit.find(params[:id])
		end

		def unit_params
			params.require(:unit).permit(:nome)
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
