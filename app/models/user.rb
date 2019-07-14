class User < ApplicationRecord
    def self.create_with_omniauth(auth)
        create! do |user|
            user.email = auth['info']['email']
            user.icon = auth['info']['image']
            user.provider = auth['provider']
            user.uid = auth['uid']
            user.name = auth['info']['nickname']
            user.oauth_token = auth['credentials']['token']
        end
    end
end
