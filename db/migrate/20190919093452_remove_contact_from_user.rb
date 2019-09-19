class RemoveContactFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :contact, :integer
  end
end
