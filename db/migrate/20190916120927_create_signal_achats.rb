class CreateSignalAchats < ActiveRecord::Migration[5.2]
  def change
    create_table :signal_achats do |t|
      t.references :user, foreign_key: true
      t.references :achat, foreign_key: true

      t.timestamps
    end
  end
end
