class User < ApplicationRecord
	after_create :welcome_send
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
	has_many :ventes
	has_many :achats
	has_many :signalls
	has_many :sent_messages, foreign_key: 'sender_id', class_name: "Message_prive"
	has_many :received_messages, foreign_key: 'recipient_id', class_name: "Message_prive"
	
	# validates :first_name, length: {in: 2..30}, presence: true
	# validates :last_name, length: {in: 2..30}, presence: true
	# validates :ville, presence: true
	# validates :email, presence: true
	# validates :password,length: {minimum: 6}, presence: true



  def welcome_send
    AdminMailer.user_created_email(self).deliver_now
  end
end
