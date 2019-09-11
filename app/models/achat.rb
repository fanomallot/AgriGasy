class Achat < ApplicationRecord
  belongs_to :user
  belongs_to :region
  belongs_to :produit

  validates :description,
  presence: true,
  length: {in: 2..30}
  validates :quantite,
  presence: true
end
