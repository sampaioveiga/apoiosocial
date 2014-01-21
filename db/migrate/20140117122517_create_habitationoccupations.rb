class CreateHabitationoccupations < ActiveRecord::Migration
  def change
    create_table :habitationoccupations do |t|
      t.string :nome

      t.timestamps
    end
  end
end
