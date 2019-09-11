class Vente < ApplicationRecord
  after_create :signal_send
  belongs_to :user
  belongs_to :region
  belongs_to :produit

  validates :description,
  presence: true,
  length: {in: 12..3000}
  validates :quantite,
  presence: true
  validates :date,
  presence: true
  validates :lieu,
  presence: true
  validates :prix,
  presence: true

  def signal_send
    AdminMailer.vente_created_email(self).deliver_now
  end
end
