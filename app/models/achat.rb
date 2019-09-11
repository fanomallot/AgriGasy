class Achat < ApplicationRecord
  belongs_to :user
  belongs_to :region
  belongs_to :produit

  validates :description,
  presence: true,
  length: {in: 12..3000}
  validates :quantite,
  presence: true
end
