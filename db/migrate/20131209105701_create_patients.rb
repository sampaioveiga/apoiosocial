class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :nome
      t.date :data_de_nascimento
      t.string :estado_civil
      t.string :habilitacoes_literarios
      t.string :residencia
      t.integer :telefone
      t.integer :sistema_de_saude
      t.integer :sistema_de_saude_numero
      t.integer :cartao_de_cidadao
      t.integer :numero_identificao_fiscal
      t.string :nome_contacto_preferencial
      t.integer :telefone_contacto_preferencial
      t.string :morada_contacto_preferencial
      t.integer :telemovel_contacto_preferencial

      t.timestamps
    end
  end
end
