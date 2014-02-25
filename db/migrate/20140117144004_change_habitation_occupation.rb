class ChangeHabitationOccupation < ActiveRecord::Migration
	def change
		rename_column :habitations, :regime_ocupacao, :habitationoccupation_id
		#change_column :habitations, :habitationoccupation_id, :integer
	end
end
