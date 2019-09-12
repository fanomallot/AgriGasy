class UserMailer < ApplicationMailer
	default from: 'AgriGasy.fr'
  def user_created_email_to_user(user)
    
    @user = user 
    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
   
    mail(to: @user.email, subject: "Vous êtes maitenant inscri sur AgriGasy") 
  end

  def achat_created_email_to_user(achat)
  	@achat = achat
  	mail(to: @achat.user.email, subject: "Vous venenz de creer une publication d'achat sur AgriGasy")
  end

  def vente_created_email_to_user(vente)
  	@vente = vente
  	mail(to: @vente.user.email, subject: "Vous venenz de creer une publication de vente sur AgriGasy")
  end
end
