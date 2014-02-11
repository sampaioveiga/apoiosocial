class PensionsController < ApplicationController
	before_action :set_pension, except: [ :index, :new, :create ]
	before_action :require_login

	def new
		@pension = Pension.new
	end

	def create
		@pension = Pension.new(pension_params)
		if @pension.save
			flash[:success] = "Nova fonte de rendimento criada"
			redirect_to pensions_path
		else
			render 'new'
		end
	end

	def index
		@pensions = Pension.order('nome')
	end

	def destroy
		@pension.destroy
		flash[:succe] = "Fonte de rendimento eliminada"
		redirect_to pensions_path
	end

	private
		def set_pension
			@pension = Pension.find(params[:id])
		end

		def pension_params
			params.require(:pension).permit(:nome)
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
