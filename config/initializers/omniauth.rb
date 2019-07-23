Rails.application.config.middleware.use OmniAuth::Builder do
   if Rails.env == "staing" 
    
    elsif Rails.env != "test"
        provider :github, Rails.application.credentials.github[:key], Rails.application.credentials.github[:secret], scope: "user,repo"
        provider :twitter, Rails.application.credentials.twitter[:key], Rails.application.credentials.twitter[:secret]
        provider :facebook, Rails.application.credentials.facebook[:key], Rails.application.credentials.facebook[:secret]
    else
        provider :github, "github_id", "github_secret", scope: "user,repo"
        provider :twitter, "twitter_id", "twitter_secret"
        provider :facebook, "facebook_id", "facebook_secret"
    end
end
