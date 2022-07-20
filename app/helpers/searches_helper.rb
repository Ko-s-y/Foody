module SearchesHelper
  def emphasize_keyword(content, keyword)
    # keyword = keyword.tr('ぁ-ん','ァ-ン').split(/[[:blank:]]+/)
    # content_array = content.tr('ぁ-ん','ァ-ン').split(/\R/)
    keyword = keyword.tr('ァ-ン','ぁ-ん').split(/[[:blank:]]+/)
    content_array = content.tr('ァ-ン','ぁ-ん').split(/\R/)
    first_match_line = content_array.find { |e| /#{keyword}/ =~ e }
    trancate_line = if first_match_line.present?
                      truncate(first_match_line, length: 110).delete '#,`,*,\,'
                    else
                      truncate(content, length: 110).delete '#,`,*,\,'
                    end
    highlight(trancate_line, keyword, :highlighter => '<span class="keyword-highlight">\1</span>')
  end
end
