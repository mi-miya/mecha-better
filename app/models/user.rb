class User < ApplicationRecord
    def self.find_or_create_from_auth(auth)
        email = auth[:info][:email]
        provider = auth[:provider]
        uid = auth[:uid]
        name = auth[:info][:nickname]
        icon = auth[:info][:image]
        oauth_token = auth[:credentials][:token]

        self.find_or_create_by(provider: provider, uid: uid) do |user|
            user.email = email
            user.name = name
            user.icon = icon
            user.provider = provider
            user.uid = uid
            user.oauth_token = oauth_token
        end
    end
end
