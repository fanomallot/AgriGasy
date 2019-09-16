class AddIsauthenticateToAchat < ActiveRecord::Migration[5.2]
  def change
    add_column :achats, :is_authenticate, :boolean
  end
end
