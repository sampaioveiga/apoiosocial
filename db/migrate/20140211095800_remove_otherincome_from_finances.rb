class RemoveOtherincomeFromFinances < ActiveRecord::Migration
	def change
		remove_column :finances, :otherincomes_id
	end
end
