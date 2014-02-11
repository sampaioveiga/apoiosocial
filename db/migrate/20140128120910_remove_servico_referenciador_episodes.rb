class RemoveServicoReferenciadorEpisodes < ActiveRecord::Migration
	def change
		remove_column :episodes, :servico_referenciador
	end
end
