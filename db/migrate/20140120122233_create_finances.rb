class CreateFinances < ActiveRecord::Migration
  def change
    create_table :finances do |t|
      t.references :patient, index: true
      t.references :pension
      t.integer :montante
      t.string :observacoes

      t.timestamps
    end
  end
end
