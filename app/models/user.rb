class User < ApplicationRecord
    # def self.create_with_omniauth(auth)
    #     create! do |user|
    #         user.email = auth['info']['email']
    #         user.icon = auth['info']['image']
    #         user.provider = auth['provider']
    #         user.uid = auth['uid']
    #         user.name = auth['info']['nickname']
    #         user.oauth_token = auth['credentials']['token']
    #     end
    # end

    def self.find_or_create_from_auth(auth)
        p auth
        provider = auth[:provider]
        uid = auth[:uid]
        nickname = auth[:info][:nickname]
        image_url = auth[:info][:image]

        self.find_or_create_by(provider: provider, uid: uid) do |user|
            user.name = nickname
            user.icon = image_url
        end
    end
end
