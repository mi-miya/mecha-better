require 'test_helper'
OmniAuth.config.test_mode = true

class SessionsControllerTest < ActionDispatch::IntegrationTest
    def setup
      @user = users(:twitter_user)
      
      OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
        :provider => 'twitter',
        :uid => 'user_uid',
        :credentials => {
          :token => "user_oauth_token"
        },
        :info =>  {
          :name => "user_name",
          :email => "user_email",
          :image => "https://avatars0.githubusercontent.com/u/24958187?...",
  
        }
      })
    end
    
    test "login and logout" do
      get root_path
      
      #ログインリンクがあるか確認
      assert_select "a[href=?]", "/auth/#{@user.provider}"
      get "/auth/#{@user.provider}"
      assert_redirected_to "/auth/#{@user.provider}/callback"
      follow_redirect!
      
      #ログインに成功してユーザーページへリダイレクト
      assert_redirected_to root_path
      follow_redirect!
      
      #ログイン後、ログアウトへのリンクがあるかチェック
      assert_select "a[href=?]", logout_path
      # ログアウトしルートへ飛ぶか
      get logout_path
      assert_redirected_to root_path
      assert_nil session[:user_id]
    end
end