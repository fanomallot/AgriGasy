class UserProvider < ApplicationRecord
  belongs_to :user

  def self.find_for_facebook_oauth(auth)

        user = UserProvider.where(:provider => auth.provider, :uid => auth.uid).first
        unless user.nil?
            user.user
        else
            registered_user = User.where(:email => auth.info.email).first
            unless registered_user.nil?
                        UserProvider.create!(
                              provider: auth.provider,
                              uid: auth.uid,
                              user_id: registered_user.id
                              )
                registered_user
            else
              nom = auth.info.name
              nom1 = nom.split(' ')
              if nom1.length >= 2
                fname = nom1[0]
                lname = nom1[1]
              else
                fname = nom1[0]
              end
              user = User.create!(
                  first_name: fname, last_name: lname,
                          email: auth.info.email,
                          password: Devise.friendly_token[0,20],
                          )
              user_provider = UserProvider.create!(
                  provider:auth.provider,
                          uid:auth.uid,
                            user_id: user.id
                  )
              user
            end
        end
    end

    def self.find_for_google_oauth(auth)
        user = UserProvider.where(:provider => auth.provider, :uid => auth.uid).first
        unless user.nil?
            user.user
        else
            registered_user = User.where(:email => auth.info.email).first
            unless registered_user.nil?
                        UserProvider.create!(
                              provider: auth.provider,
                              uid: auth.uid,
                              user_id: registered_user.id
                              )
                registered_user
            else
              nom = auth.info.name
              nom1 = nom.split(' ')
              if nom1.length >= 2
                fname = nom1[0]
                lname = nom1[1]
              else
                fname = nom1[0]
              end
              user = User.create!(
                  first_name: fname, last_name: lname,
                            email: auth.info.email,
                            password: Devise.friendly_token[0,20],
                          )
              user_provider = UserProvider.create!(
                  provider:auth.provider,
                          uid:auth.uid,
                          user_id: user.id
                  )
              user
          end
        end
    end

end
