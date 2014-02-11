class RemoveOtherincomeFinances < ActiveRecord::Migration
	def change
		remove_column :finances, :otherincome_id
	end
end
