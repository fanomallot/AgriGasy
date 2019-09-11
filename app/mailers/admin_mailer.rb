class AdminMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'
 
  def user_created_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 
    @admin = User.find(1)

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
   
    mail(to: @admin.email, subject: 'un utilisateur nomé #{user.first_name}vient d etre creéé') 
  end

  def vente_created_email(vente)
  	@vente = vente
  	 @admin = User.find(1)

  	mail(to: @admin.email,subject: 'une publication de vente vient d''être creer' )
  end

  def achat_created_email(achat)
  	@achat = achat
  	 @admin = User.find(1)
  	mail(to: @admin.email,subject: 'une publication de vente vient d''être creer' )
  end
end
