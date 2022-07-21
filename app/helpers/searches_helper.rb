module SearchesHelper
  def pick_trancate_sentence(content, keyword)
    keyword = keyword.split(/[[:blank:]]+/)
    content_array = content.split(/\R/)
    first_match_line = content_array.find { |e| /#{keyword}/ =~ e }
    if first_match_line.present?
      truncate(first_match_line, length: 50, omission: "・・・・・")
    else
      truncate(content, length: 50, omission: "・・・・・")
    end
    # trancate_line = if first_match_line.present?
    #                   truncate(first_match_line, length: 50, omission: "・・・・・")
    #                 else
    #                   truncate(content, length: 50, omission: "・・・・・")
    #                 end
    # highlight(trancate_line, keyword, highlighter: '<span class="keyword-highlight">\1</span>')
  end
end
