class CreateHabitations < ActiveRecord::Migration
  def change
    create_table :habitations do |t|
      t.references :patient, index: true
      t.references :habitationtype
      t.references :habitationoccupation
      t.integer :numero_quartos
      t.boolean :sala
      t.boolean :casa_de_banho
      t.boolean :barreiras
      t.boolean :agua_canalizada
      t.boolean :electricidade
      t.boolean :esgotos
      t.string :estado_de_conservacao
      t.string :observacoes
      t.string :morada
      t.integer :cpostal
      t.integer :cpostalext
      t.string :localidade
      t.string :meio_residencia

      t.timestamps
    end
  end
end
