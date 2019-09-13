class Achat < ApplicationRecord
  after_create :signal_send_to_admin, :signal_send_to_user
  belongs_to :user
  belongs_to :region
  belongs_to :produit

  has_one_attached :avatarachat

  validates :description,
  presence: true,
  length: {in: 12..3000}
  validates :quantite,
  presence: true

  def signal_send_to_admin
   	AdminMailer.achat_created_email(self).deliver_now
  end

  def signal_send_to_user
    UserMailer.achat_created_email_to_user(self).deliver_now
  end
end
