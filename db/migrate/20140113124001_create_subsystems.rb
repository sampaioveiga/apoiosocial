class CreateSubsystems < ActiveRecord::Migration
  def change
    create_table :subsystems do |t|
      t.string :nome

      t.timestamps
    end
  end
end
