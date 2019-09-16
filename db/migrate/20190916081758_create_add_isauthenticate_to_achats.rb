class CreateAddIsauthenticateToAchats < ActiveRecord::Migration[5.2]
  def change
    create_table :add_isauthenticate_to_achats do |t|
      t.boolean :is_authenticate

      t.timestamps
    end
  end
end
