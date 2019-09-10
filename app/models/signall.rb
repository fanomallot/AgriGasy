class Signall < ApplicationRecord
  belongs_to :user
  belongs_to :vente
  belongs_to :achat
end
