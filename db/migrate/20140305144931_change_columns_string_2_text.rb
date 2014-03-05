class ChangeColumnsString2Text < ActiveRecord::Migration
	def change
		remove_column	:episodes, :diagnostico
		add_column		:episodes, :diagnostico, :text
		remove_column	:episodes, :encaminhamento
		add_column		:episodes, :encaminhamento, :text
		remove_column	:notes, :nota
		add_column		:notes, :nota, :text
		remove_column	:habitations, :observacoes
		add_column		:habitations, :observacoes, :text
	end
end
