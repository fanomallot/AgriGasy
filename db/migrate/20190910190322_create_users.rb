class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :ville
      t.integer :contact
      t.text :description
      t.string :email
      t.string :encrypted_password
      t.boolean :is_admin
      t.belongs_to :region, index: true

      t.timestamps
    end
  end
end
