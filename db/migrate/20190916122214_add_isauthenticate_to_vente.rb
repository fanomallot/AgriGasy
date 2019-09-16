class AddIsauthenticateToVente < ActiveRecord::Migration[5.2]
  def change
    add_column :ventes, :is_authenticate, :boolean
  end
end
