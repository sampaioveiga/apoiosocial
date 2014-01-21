class HabitationHasHabitationType < ActiveRecord::Migration
	def change
		rename_column :habitations, :tipo_habitacao, :habitationtype_id
		change_column :habitations, :habitationtype_id, :integer
	end
end
