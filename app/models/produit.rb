class Produit < ApplicationRecord
	has_many :ventes
	has_many :achats
end
