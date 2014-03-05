class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :nome
      t.string :morada
      t.string :localidade
      t.integer :telefone
      t.integer :telemovel
      t.string :email
      t.references :patient

      t.timestamps
    end

    add_index :contacts, :patient_id
  end
end
