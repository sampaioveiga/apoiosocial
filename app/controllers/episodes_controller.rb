class EpisodesController < ApplicationController
	before_action :require_login

	def new
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
