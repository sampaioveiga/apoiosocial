class CreateSocialfamilies < ActiveRecord::Migration
  def change
    create_table :socialfamilies do |t|
      t.references :patient, index: true
      t.string :companhia
      t.string :apoio
      t.string :observacoes

      t.timestamps
    end
  end
end
