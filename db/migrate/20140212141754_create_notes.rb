class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.date :data
      t.string :nota
      t.references :episode
      t.references :user

      t.timestamps
    end
  end
end
