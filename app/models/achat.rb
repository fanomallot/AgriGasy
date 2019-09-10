class Achat < ApplicationRecord
  belongs_to :user
  belongs_to :region
  belongs_to :produit
end
