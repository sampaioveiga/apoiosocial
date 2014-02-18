class AddEpisodeReferencesToNotas < ActiveRecord::Migration
	def change
		add_column :notes, :episode_id, :integer
	end
end
