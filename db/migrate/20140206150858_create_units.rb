class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :nome

      t.timestamps
    end
  end
end
