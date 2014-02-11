class RemoveOcupacaoFromFinaces < ActiveRecord::Migration
	def change
		remove_column :finances, :ocupacao
	end
end
