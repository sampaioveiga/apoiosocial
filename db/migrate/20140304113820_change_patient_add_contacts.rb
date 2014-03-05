class ChangePatientAddContacts < ActiveRecord::Migration
	def change
		add_column :patients, :email, :string
		remove_column :patients, :nome_contacto_preferencial
		remove_column :patients, :telefone_contacto_preferencial
		remove_column :patients, :morada_contacto_preferencial
		remove_column :patients, :telemovel_contacto_preferencial
	end
end
