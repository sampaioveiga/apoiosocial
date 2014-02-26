class CreatePensions < ActiveRecord::Migration
  def change
    create_table :pensions do |t|
      t.string :nome, index: true

      t.timestamps
    end
  end
end
