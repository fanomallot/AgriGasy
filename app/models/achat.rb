class Achat < ApplicationRecord
  after_create :signal_send
  belongs_to :user
  belongs_to :region
  belongs_to :produit

  validates :description,
  presence: true,
  length: {in: 12..3000}
  validates :quantite,
  presence: true

  def signal_send
   	AdminMailer.achat_created_email(self).deliver_now
  end
end
