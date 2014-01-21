class CreateFinances < ActiveRecord::Migration
  def change
    create_table :finances do |t|
      t.references :patient, index: true
      t.string :complemento_por_dependencia
      t.boolean :complemento_solidario_idosos
      t.string :ocupacao
      t.integer :montante
      t.string :observacoes

      t.timestamps
    end
  end
end
