class AdminMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'
 
  def user_created_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 
    @admin = User.find(1)

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.

    mail(to: @admin.email, subject: "Un utilisateur nomé #{user.first_name} vient d etre creéé") 
  end

  def vente_created_email(vente)
  	@vente = vente
  	 @admin = User.find(1)
  	mail(to: @admin.email,subject: "Une publication de vente vient d'être creer par #{@vente.user.first_name}")
  end

  def achat_created_email(achat)
  	@achat = achat
  	 @admin = User.find(1)
  	mail(to: @admin.email,subject:"Une publication de achat vient d'être creer par #{@achat.user.first_name}")
  end
end
