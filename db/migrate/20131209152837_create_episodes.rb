class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.references :patient, index: true
      t.date :data
      t.string :servico_referenciador
      t.string :primeiro_contacto
      t.string :orientacao
      t.string :observacoes

      t.timestamps
    end
  end
end
