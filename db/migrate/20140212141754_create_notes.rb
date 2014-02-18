class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.date :data
      t.string :nota

      t.timestamps
    end
  end
end
