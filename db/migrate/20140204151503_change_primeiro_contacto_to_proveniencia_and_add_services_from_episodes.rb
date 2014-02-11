class ChangePrimeiroContactoToProvenienciaAndAddServicesFromEpisodes < ActiveRecord::Migration
	def change
		rename_column :episodes, :primeiro_contacto, :proveniencia
		add_column :episodes, :service, :string
	end
end
