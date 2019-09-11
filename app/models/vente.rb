class Vente < ApplicationRecord
  belongs_to :user
  belongs_to :region
  belongs_to :produit

  validates :description,
  presence: true
  , length: {in: 2..30}
  validates :quatite,
  presence: true
  validates :date,
  presence: true
  validates :lieu,
  presence: true
  validates :prix,
  presence: true
end
