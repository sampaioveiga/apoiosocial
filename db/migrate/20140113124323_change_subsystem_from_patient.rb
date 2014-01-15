class ChangeSubsystemFromPatient < ActiveRecord::Migration
	def change
		rename_column :patients, :sistema_de_saude, :subsystem_id
		rename_column :patients, :sistema_de_saude_numero, :subsystem_number
		change_column :patients, :subsystem_id, :integer
	end
end
