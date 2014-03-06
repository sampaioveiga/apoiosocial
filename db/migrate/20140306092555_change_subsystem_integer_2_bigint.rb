class ChangeSubsystemInteger2Bigint < ActiveRecord::Migration
	def change
		remove_column :patients, :subsystem_number
		add_column :patients, :subsystem_number, :integer, limit: 8
	end
end
