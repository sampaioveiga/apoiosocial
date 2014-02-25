class ChangeFinance < ActiveRecord::Migration
	def change
		rename_column :finances, :complemento_por_dependencia, :pension_id
		#change_column :finances, :pension_id, :integer
		rename_column :finances, :complemento_solidario_idosos, :otherincome_id
		#change_column :finances, :otherincome_id, :integer
		remove_column :finances, :ocupacao
	end
end
