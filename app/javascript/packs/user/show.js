// 投稿一覧セクション表示関数
$(function() {
  $(document).on('click', '.appear-posted-section', function() {
    $('.remember-posts-section').css({
      'display': 'none'
    });
    $('.user-posted-section').css({
      'display': 'block'
    });
    $('.appear-posted-section').css({
      'background-color': 'whitesmoke'
    });
    $('.appear-remember-section').css({
      'background-color': 'white'
    });
  });
});

// rememberした投稿セクション表示関数
$(function() {
  $(document).on('click', '.appear-remember-section', function() {
    $('.user-posted-section').css({
      'display': 'none'
    });
    $('.remember-posts-section').css({
      'display': 'block'
    });
    $('.appear-remember-section').css({
      'background-color': 'whitesmoke'
    });
    $('.appear-posted-section').css({
      'background-color': 'white'
    });
  });
});
