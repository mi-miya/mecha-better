module IdeasHelper
    def tags(idea)
        idea.tag.split(",")
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
end
