class MessagePrive < ApplicationRecord
	belongs_to :sender, class_name: "User"
	belongs_to :recipient, class_name: "User"

	validates :title,
	presence: true,
	length: {in: 2..30}
	validates :content, 
	presence: true,
	length: {in: 13..3000}
end
