class CreatePensions < ActiveRecord::Migration
  def change
    create_table :pensions do |t|
      t.string :nome

      t.timestamps
    end
  end
end
