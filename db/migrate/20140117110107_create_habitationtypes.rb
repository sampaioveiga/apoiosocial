class CreateHabitationtypes < ActiveRecord::Migration
  def change
    create_table :habitationtypes do |t|
      t.string :nome, index: true

      t.timestamps
    end
  end
end
