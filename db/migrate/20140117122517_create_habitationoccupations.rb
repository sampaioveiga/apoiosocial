class CreateHabitationoccupations < ActiveRecord::Migration
  def change
    create_table :habitationoccupations do |t|
      t.string :nome, index: true

      t.timestamps
    end
  end
end
