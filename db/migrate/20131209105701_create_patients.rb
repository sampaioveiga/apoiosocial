class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :nome
      t.date :data_de_nascimento
      t.string :estado_civil
      t.string :habilitacoes_literarios
      t.string :residencia
      t.integer :telefone
      t.integer :subsystem_id
      t.integer :subsystem_number
      t.integer :cartao_de_cidadao, index: true
      t.integer :numero_identificacao_fiscal, index: true
      t.string :nome_contacto_preferencial
      t.integer :telefone_contacto_preferencial
      t.string :morada_contacto_preferencial
      t.integer :telemovel_contacto_preferencial
      t.string :genero
      t.integer :rnu, index: true
      t.string :ocupacao

      t.timestamps
    end
  end
end
