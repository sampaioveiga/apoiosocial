class CreateSocialfamilies < ActiveRecord::Migration
  def change
    create_table :socialfamilies do |t|
      t.references :patient, index: true
      t.references :socialfamilyhelp
      t.string :companhia
      t.string :apoio
      t.string :observacoes

      t.timestamps
    end
  end
end
