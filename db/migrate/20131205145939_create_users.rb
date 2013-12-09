class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nome
      t.integer :numero_mecanografico
      t.string :email
      t.string :password_digest
      t.boolean :auth
      t.boolean :admin

      t.timestamps
    end
  end
end
