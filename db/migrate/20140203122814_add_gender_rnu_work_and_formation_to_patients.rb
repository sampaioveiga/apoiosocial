class AddGenderRnuWorkAndFormationToPatients < ActiveRecord::Migration
	def change
		add_column :patients, :genero, :string
		add_column :patients, :rnu, :integer
		add_column :patients, :ocupacao, :string
		add_index :patients, :rnu, unique: true
	end
end
