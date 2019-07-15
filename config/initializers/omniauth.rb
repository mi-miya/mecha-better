Rails.application.config.middleware.use OmniAuth::Builder do
    provider :github, Rails.application.credentials.github[:key], Rails.application.credentials.github[:secret], scope: "user,repo"
    provider :twitter, Rails.application.credentials.twitter[:key], Rails.application.credentials.twitter[:secret]
end
