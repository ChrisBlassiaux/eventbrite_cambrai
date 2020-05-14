class UserMailer < ApplicationMailer
  default from: 'chrisblassiaux@gmail.com'
 
  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://events-cambrai.herokuapp.com/'

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def new_attendance(attendance)
    @user = User.find(attendance.user_id)

    @url  = 'https://events-cambrai.herokuapp.com/'

    mail(to: @user.email, subject: 'Un nouveau participant a ton évènement !')
  end

end
