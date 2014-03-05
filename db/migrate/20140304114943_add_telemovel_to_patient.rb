class AddTelemovelToPatient < ActiveRecord::Migration
	def change
		add_column :patients, :telemovel, :integer
	end
end
