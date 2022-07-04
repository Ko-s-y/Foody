// 投稿セクション出現関数
$(function() {
  $(document).on('click', '.appear-posted-section', function() {
    $('.liked-posts-section').css({
      'display': 'none'
    });
    $('.remember-posts-section').css({
      'display': 'none'
    });
    $('.user-posted-section').css({
      'display': 'block'
    });
  });
});

//　　いいねした投稿セクション出現関数
$(function() {
  $(document).on('click', '.appear-liked-section', function() {
    $('.remember-posts-section').css({
      'display': 'none'
    });
    $('.user-posted-section').css({
      'display': 'none'
    });
    $('.liked-posts-section').css({
      'display': 'block'
    });
  });
});


// rememberした投稿セクション出現関数
$(function() {
  $(document).on('click', '.appear-remember-section', function() {
    $('.liked-posts-section').css({
      'display': 'none'
    });
    $('.user-posted-section').css({
      'display': 'none'
    });
    $('.remember-posts-section').css({
      'display': 'block'
    });
  });
});

