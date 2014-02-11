class AddResidenciaToHabitation < ActiveRecord::Migration
	def change
		add_column :habitations, :morada, :string
		add_column :habitations, :cpostal, :integer
		add_column :habitations, :cpostalext, :integer
		add_column :habitations, :localidade, :string
		add_column :habitations, :meio_residencia, :string
	end
end
