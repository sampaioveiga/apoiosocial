class AddInsuficienciaEconomicaToPatientFinances < ActiveRecord::Migration
	def change
		add_column :finances, :insuficiencia_economica, :boolean
		add_column :finances, :data_consulta_rnu, :date
		add_column :finances, :data_validade, :date
	end
end
