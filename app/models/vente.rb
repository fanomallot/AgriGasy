class Vente < ApplicationRecord
  after_create :signal_send_to_admin, :signal_send_to_user
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

  def signal_send_to_admin
    AdminMailer.vente_created_email(self).deliver_now
  end

  def signal_send_to_user
    UserMailer.vente_created_email_to_user(self).deliver_now
  end
end
