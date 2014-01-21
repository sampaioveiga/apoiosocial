class CreateOtherincomes < ActiveRecord::Migration
  def change
    create_table :otherincomes do |t|
      t.string :nome

      t.timestamps
    end
  end
end
