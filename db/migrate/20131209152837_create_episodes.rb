class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.references :patient, index: true
      t.date :data
      t.date :data_pedido_colaboracao
      t.references :unit
      t.references :service
      t.references :program
      t.references :intervention
      t.references :user
      t.string :diagnostico
      t.string :encaminhamento
      t.boolean :estado, default: false

      t.timestamps
    end
  end
end
