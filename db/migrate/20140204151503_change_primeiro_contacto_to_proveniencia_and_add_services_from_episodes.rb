class ChangePrimeiroContactoToProvenienciaAndAddServicesFromEpisodes < ActiveRecord::Migration
	def change
		rename_column :episodes, :primeiro_contacto, :proveniencia
		#add_column :episodes, :service, :string
		add_column :episodes, :service, :integer
	end
end
