class AddColonneToMessagePrive < ActiveRecord::Migration[5.2]
  def change
    add_column :message_prives, :is_read, :boolean
  end
end
