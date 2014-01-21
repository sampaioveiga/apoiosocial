class HabitationoccupationsController < ApplicationController
	before_action :require_login
	before_action :set_habitationoccupation, except: [ :index, :new, :create ]

	def index
		@habitationoccupations = Habitationoccupation.order('nome')
	end

	def new
		@habitationoccupation = Habitationoccupation.new
	end

	def create
		@habitationoccupation = Habitationoccupation.new(habitationoccupation_params)
		if @habitationoccupation.save
			flash[:success] = "Regime de ocupação criado"
			redirect_to habitationoccupations_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @habitationoccupation.update(habitationoccupation_params)
			flash[:success] = "Regime de ocupação alterado"
			redirect_to habitationoccupations_path
		else
			render 'edit'
		end
	end

	private
		def habitationoccupation_params
			params.require(:habitationoccupation).permit(:nome)
		end

		def set_habitationoccupation
			@habitationoccupation = Habitationoccupation.find(params[:id])
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
