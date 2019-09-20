class AdminMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'
 
  def user_created_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 
    @admin = User.where(is_admin: true)

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://agrigasy.herokuapp.com' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    @admin.each do |admin|
      mail(to: admin.email, subject: "Un utilisateur nomé #{user.first_name} vient d etre creéé") 
    end
  end

  def vente_created_email(vente)
  	@vente = vente
  	@admin = User.where(is_admin: true)
    @admin.each do |admin|
  	 mail(to: admin.email,subject: "Une publication de vente vient d'être creer par #{@vente.user.first_name}")
    end
  end

  def achat_created_email(achat)
  	@achat = achat
    @admin = User.where(is_admin: true)
    @admin.each do |admin|
  	 mail(to: admin.email,subject:"Une publication de achat vient d'être creer par #{@achat.user.first_name}")
    end
  end
end
