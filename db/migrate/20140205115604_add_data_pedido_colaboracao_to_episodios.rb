class AddDataPedidoColaboracaoToEpisodios < ActiveRecord::Migration
	def change
		rename_column :episodes, :service, :proveniencia2
		rename_column :episodes, :orientacao, :encaminhamento
		add_column :episodes, :data_pedido_colaboracao, :date
		add_column :episodes, :program_id, :integer
		add_column :episodes, :intervention_id, :integer
		add_column :episodes, :diagnostico, :string
		remove_column :episodes, :observacoes
	end
end
