class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :nome, index: true

      t.timestamps
    end
  end
end
