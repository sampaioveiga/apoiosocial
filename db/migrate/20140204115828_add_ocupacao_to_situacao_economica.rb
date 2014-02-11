class AddOcupacaoToSituacaoEconomica < ActiveRecord::Migration
	def change
		add_column :finances, :ocupacao, :string
	end
end
