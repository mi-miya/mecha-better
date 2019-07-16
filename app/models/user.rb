class User < ApplicationRecord
    has_many :ideas
    has_many :idea_reactions
    has_many :applauses

    def self.find_or_create_from_auth(auth)
        email = auth[:info][:email]
        provider = auth[:provider]
        uid = auth[:uid]
        icon = auth[:info][:image]
        oauth_token = auth[:credentials][:token]
        case provider
        when "twitter", "facebook" then
            name = auth[:info][:name]
        when "github" then
            name = auth[:info][:nickname]
        end

        self.find_or_create_by(provider: provider, uid: uid) do |user|
            user.email = email
            user.name = name
            user.icon = icon
            user.provider = provider
            user.uid = uid
            user.oauth_token = oauth_token
        end
    end

    # 拍手
    def applaud(idea)
        applause = Applause.find_by(idea_id: idea.id)
        if self.applauded?(idea)
            applause.count += 1
            applause.save
        else
            Applause.create(user_id: self.id, idea_id: idea.id, count: 1)
        end
    end

    # 拍手を取り消す
    def un_applaud(idea)
        applause = applauses.find_by(idea_id: idea.id)
        applause.destroy if applause
    end

    # 既に拍手しているか判定
    def  applauded?(idea)
        !!self.applauses.find_by(idea_id: idea.id)
    end

end
