class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :nome, index: true

      t.timestamps
    end
  end
end
