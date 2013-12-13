class ChangeColumnNifPatient < ActiveRecord::Migration
	def change
		rename_column :patients, :numero_identificao_fiscal, :numero_identificacao_fiscal
	end
end
