class StaticPagesController < ApplicationController
	before_action :require_login

	def index
		@episodes = Episode.where(estado: false).order('data DESC').find_all_by_user_id(current_user.id)
		#@notes = Note.limit(5).order('data DESC')
		@patients = Patient.limit(3).order('created_at DESC')
	end

	private
		def require_login
			unless logged_in?
				redirect_to login_path
			end
		end

		def logged_in?
			!!current_user
		end
end