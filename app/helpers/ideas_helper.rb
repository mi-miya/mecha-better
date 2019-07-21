module IdeasHelper
    def tags(idea)
        idea.tag.split(",")
    end

    def left_or_right(idea_user, reaction_user)
        if(idea_user == reaction_user)
            return "reaction_right"
        else
            return "reaction_left"
        end
    end

    def find_radio(checked)
        case checked
        when "" then
            return "state_"
        when "未実現" then
            return "state_mijitugen"
        when "実現済み" then
            return "state_jitugenzumi"
        when "対応中" then
            return "state_taioutyuu"
        when "既にある" then
            return "state_sudeniaru"
        end
    end

    def get_state_comment(state)
        case state
        when "未実現" then
            {head: "このアイデアはまだ実現していません！",text: "実現できるよう、あなたの応援やお力をお貸し下さい！"}
        when "実現済み" then
            {head: "このアイデアは見事、実現いたしました！",text: "みなさまご協力ありがとうございました"}
        when "対応中" then
            {head: "このアイデアは、現在実現に向けて対応中です",text: "拍手やコメントで応援してください！"}
        when "既にある" then
            {head: "このアイデアは既に実現済みです",text: "新しいアイデアを投稿してみましょう！"}
        end
    end
end
