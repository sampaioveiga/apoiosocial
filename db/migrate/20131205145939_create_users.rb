class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nome
      t.integer :numero_mecanografico, index: true
      t.string :email, index: true
      t.string :password_digest
      t.boolean :auth
      t.boolean :admin

      t.timestamps
    end
  end
end
