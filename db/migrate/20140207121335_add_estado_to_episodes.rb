class AddEstadoToEpisodes < ActiveRecord::Migration
	def change
		add_column :episodes, :estado, :boolean, default: false
	end
end
