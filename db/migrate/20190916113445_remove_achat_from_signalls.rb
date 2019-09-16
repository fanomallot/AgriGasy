class RemoveAchatFromSignalls < ActiveRecord::Migration[5.2]
  def change
    remove_reference :signalls, :achat, foreign_key: true
  end
end
