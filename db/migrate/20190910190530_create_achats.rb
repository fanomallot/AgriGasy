class CreateAchats < ActiveRecord::Migration[5.2]
  def change
    create_table :achats do |t|
      t.string :nom
      t.text :description
      t.string :quantite
      t.string :prix
      t.datetime :date
      t.string :lieu
      t.references :user, foreign_key: true
      t.belongs_to :region, index: true
      t.belongs_to :produit, index: true

      t.timestamps
    end
  end
end
