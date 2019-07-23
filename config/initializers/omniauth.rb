Rails.application.config.middleware.use OmniAuth::Builder do
    provider :github, Rails.application.credentials[Rails.env.to_sym][:github][:key], Rails.application.credentials[Rails.env.to_sym][:github][:secret], scope: "user,repo"
    provider :twitter, Rails.application.credentials[Rails.env.to_sym][:twitter][:key], Rails.application.credentials[Rails.env.to_sym][:twitter][:secret]
    provider :facebook, Rails.application.credentials[Rails.env.to_sym][:facebook][:key], Rails.application.credentials[Rails.env.to_sym][:facebook][:secret]
end
