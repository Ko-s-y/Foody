// 投稿一覧セクション出現関数
$(function() {
  $(document).on('click', '.appear-posted-section', function() {
    $('.remember-posts-section').css({
      'display': 'none'
    });
    $('.user-posted-section').css({
      'display': 'block'
    });
  });
});

// rememberした投稿セクション出現関数
$(function() {
  $(document).on('click', '.appear-remember-section', function() {
    $('.user-posted-section').css({
      'display': 'none'
    });
    $('.remember-posts-section').css({
      'display': 'block'
    });
  });
});

// userの活動実績表示関数
$(function() {
  $(document).on('click', '.appear-user-data', function() {
    $('.appear-user-data').css({
      'display': 'none'
    });
    $('.disappear-user-data').css({
      'display': 'block'
    });
    $('.user-data').css({
      'display': 'block'
    });
  });
});

// userの活動実績の非表示関数
$(function() {
  $(document).on('click', '.disappear-user-data', function() {
    $('.disappear-user-data').css({
      'display': 'none'
    });
    $('.appear-user-data').css({
      'display': 'block'
    });
    $('.user-data').css({
      'display': 'none'
    });
  });
});
