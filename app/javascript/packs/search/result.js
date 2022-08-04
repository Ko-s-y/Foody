// 検索ヒント表示/非表示関数
$(function() {
  $(document).on('click', '.search-advise-btn', function() {
    $('.search-result').css({
      'display': 'none'
    });
    $('.search-advise').css({
      'display': 'block'
    });
  });
});

$(function() {
  $(document).on('click', '.dis-advise-btn', function() {
    $('.search-advise').css({
      'display': 'none'
    });
    $('.search-result').css({
      'display': 'block'
    });
  });
});
