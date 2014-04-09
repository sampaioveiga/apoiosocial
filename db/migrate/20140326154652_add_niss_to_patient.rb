class AddNissToPatient < ActiveRecord::Migration
	def change
		add_column :patients, :niss, :integer, limit: 8
	end
end
