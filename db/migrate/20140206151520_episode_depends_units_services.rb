class EpisodeDependsUnitsServices < ActiveRecord::Migration
	def change
		rename_column :episodes, :proveniencia, :unit_id
		change_column :episodes, :unit_id, :integer
		rename_column :episodes, :proveniencia2, :service_id
		change_column :episodes, :service_id, :integer
	end
end
