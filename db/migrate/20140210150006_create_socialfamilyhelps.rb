class CreateSocialfamilyhelps < ActiveRecord::Migration
  def change
    create_table :socialfamilyhelps do |t|
      t.string :nome

      t.timestamps
    end
  end
end
