require 'test_helper'

class IdeaTest < ActiveSupport::TestCase
  def setup
    User.create(id: 1, name: "user1")
    @idea = Idea.new(user_id: 1, title: "title", body: "bodybodybody", tag: "tag", state: "未実現")
  end

  test "Ideaモデル バリデーションテスト" do
    assert @idea.save
    ### Save失敗ケース
    # Userが空の場合
    @idea.user_id = nil
    assert_not @idea.save
    @idea.user_id = 1

    # titleが空の場合
    @idea.title = nil
    assert_not @idea.save
    @idea.title = "title"

    # bodyが空の場合
    @idea.body = nil
    assert_not @idea.save
    # bodyが文字数不足の場合
    @idea.body = "body"
    assert_not @idea.save
    @idea.body = "bodybodybody"

    # stateが空の場合
    @idea.state = nil
    assert_not @idea.save
    # stateが予期しない文字列の場合
    @idea.state = "あいうえお"
    assert_not @idea.save

    @idea.state = "実現済み"
    assert @idea.save
  end
end
