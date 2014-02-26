class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :nome, index: true

      t.timestamps
    end
  end
end
