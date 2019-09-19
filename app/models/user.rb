class User < ApplicationRecord
	after_create :welcome_send_to_admin, :welcome_send_to_user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook]
         
	has_many :ventes
	has_many :achats
	has_many :signalls
	has_many :sent_messages, foreign_key: 'sender_id', class_name: "Message_prive"
	has_many :received_messages, foreign_key: 'recipient_id', class_name: "Message_prive"

	has_one_attached :profil
	
	# validates :first_name, length: {in: 2..30}, presence: true
	# validates :last_name, length: {in: 2..30}, presence: true
	# validates :ville, presence: true
	# validates :email, presence: true
	# validates :password,length: {minimum: 6}, presence: true

	def self.from_omniauth(auth)
	  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	    user.email = auth.info.email
	    user.password = Devise.friendly_token[0, 20]
	    user.first_name = auth.info.name   # assuming the user model has a name
	    # user.image = auth.info.image # assuming the user model has an image
	    # If you are using confirmable and the provider(s) you use validate emails, 
	    # uncomment the line below to skip the confirmation emails.
	    # user.skip_confirmation!
	  end
	end

	def self.new_with_session(params, session)
	    super.tap do |user|
	      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
	        user.email = data["email"] if user.email.blank?
	      end
	    end
	end

  def welcome_send_to_admin
    AdminMailer.user_created_email(self).deliver_now
  end

  def welcome_send_to_user
  	UserMailer.user_created_email_to_user(self).deliver_now
  end
end
